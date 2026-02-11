Class guard.SnapshotGenerator
{

ClassMethod run() [ Language = python ]
{
    import iris

    directories = iris.cls("guard.SnapshotGenerator").listAllDirectories()
    for dir in directories:
        list_of_globals = iris.cls("guard.SnapshotGenerator").listGlobals(dir)
        for global_info in list_of_globals:
            snapshot = iris.cls("guard.GlobalSnapshot")._New()
            snapshot.SnapshotDate = global_info["SnapshotDate"]
            snapshot.GlobalName = global_info["GlobalName"]
            snapshot.Location = global_info["Location"]
            snapshot.AllocatedMB =global_info["AllocatedMB"]
            snapshot.UsedMB = global_info["UsedMB"]
            snapshot.Tables = global_info["Tables"]
            snapshot.PrevSnapshotId = global_info["PrevSnapshotId"]
            snapshot.GrowthMB = global_info["GrowthMB"]
            snapshot.GrowthPct = global_info["GrowthPct"]
            snapshot._Save()
}

ClassMethod listAllDirectories() As %List [ Language = python ]
{
    import iris

    list_of_directories = []
    stmt = iris.sql.prepare("SELECT DISTINCT %EXACT(Directory) FROM Config.Databases WHERE SectionHeader = 'Databases'")
    rs = stmt.execute()
    for idx, row in enumerate(rs):
        list_of_directories.append(row[0])

    return list_of_directories
}

ClassMethod listGlobals(directory As %String) As %List [ Language = python ]
{
    import iris
    import datetime
    from decimal import Decimal

    list_of_globals = []
    
    query = "SELECT Name,\"Allocated MB\",\"Used MB\" FROM %SYS.GlobalQuery_Size(?, '', '*','2') "
    stmt = iris.sql.prepare(query)
    rs = stmt.execute(directory)
    for idx, row in enumerate(rs):
        global_name = row[0]

        global_info = {
            "GlobalName": global_name,
            "SnapshotDate": datetime.date.today(),
            "Location": directory,
            "AllocatedMB": Decimal(row[1]),
            "UsedMB": Decimal(row[2]),
            "Tables": [],

            "PrevSnapshotId": None,
            "GrowthMB": None,
            "GrowthPct": None
        }

        if global_info["UsedMB"] == 0:
            continue

        global_info["Tables"] = iris.cls("guard.SnapshotGenerator").getMappedTables(global_name)
        
        global_info["PrevSnapshotId"] = iris.cls("guard.SnapshotGenerator").getPreviousSnapshotId(global_name, directory)
        if global_info["PrevSnapshotId"] is not None:
            prev_snapshot = iris.cls("guard.GlobalSnapshot")._OpenId(global_info["PrevSnapshotId"])
            global_info["GrowthMB"] = global_info["UsedMB"] - prev_snapshot.UsedMB
            global_info["GrowthPct"] = (global_info["GrowthMB"] / prev_snapshot.UsedMB) * Decimal(100)
    
        list_of_globals.append(global_info)

    return list_of_globals
}

ClassMethod getMappedTables(globalName As %String) As %Status [ Language = python ]
{
    import iris
    globalName = "^" + globalName
    query = """
        SELECT parent FROM %Dictionary.CompiledStorage
            WHERE DataLocation = ?
        UNION ALL
        SELECT parent FROM %Dictionary.CompiledStorage
            WHERE IdLocation = ?
        UNION ALL
        SELECT parent FROM %Dictionary.CompiledStorage
            WHERE IndexLocation = ?
        UNION ALL
        SELECT parent FROM %Dictionary.CompiledStorage
            WHERE StreamLocation = ?
    """
    stmt = iris.sql.prepare(query)
    rs = stmt.execute(globalName, globalName, globalName, globalName)
    tables = []
    for idx, row in enumerate(rs):
        if row[0] not in tables:
            tables.append(row[0])

    return tables
}

ClassMethod getPreviousSnapshotId(globalName As %String, directory As %String) As %Integer [ Language = python ]
{
    import iris
    query = "SELECT TOP 1 Id FROM guard.GlobalSnapshot WHERE GlobalName = ? AND Location = ? ORDER BY SnapshotDate DESC"
    stmt = iris.sql.prepare(query)
    rs = stmt.execute(globalName, directory)
    for idx, row in enumerate(rs):
        return row[0]
    return None
}

}
