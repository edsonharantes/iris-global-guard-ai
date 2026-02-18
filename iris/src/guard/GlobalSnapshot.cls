Class guard.GlobalSnapshot Extends %Persistent
{

Property SnapshotDate As %DateTime [ Required ];

Index IdxSnapshotDate On SnapshotDate;

Property GlobalName As %String [ Required ];

Index IdxGlobalName On GlobalName;

Index IdxGlobalTime On (GlobalName, SnapshotDate);

Property Location As %String;

Index IdxLocation On Location;

Index IdxLocationTime On (Location, SnapshotDate);

Index IdxGlobalLocation On (GlobalName, Location);

Property AllocatedMB As %String;

Property UsedMB As %String;

Index IdxUsedMB On UsedMB;

Property Tables As %String(MAXLEN = 1000);

Property PrevSnapshotId As %Integer;

Property GrowthMB As %String;

Index IdxGrowthMB On GrowthMB;

Property GrowthPct As %String;

Index IdxGrowthPct On GrowthPct;

Storage Default
{
<Data name="GlobalSnapshotDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SnapshotDate</Value>
</Value>
<Value name="3">
<Value>GlobalName</Value>
</Value>
<Value name="4">
<Value>Location</Value>
</Value>
<Value name="5">
<Value>AllocatedMB</Value>
</Value>
<Value name="6">
<Value>UsedMB</Value>
</Value>
<Value name="7">
<Value>Tables</Value>
</Value>
<Value name="8">
<Value>PrevSnapshotId</Value>
</Value>
<Value name="9">
<Value>GrowthMB</Value>
</Value>
<Value name="10">
<Value>GrowthPct</Value>
</Value>
</Data>
<DataLocation>^guard.GlobalSnapshotD</DataLocation>
<DefaultData>GlobalSnapshotDefaultData</DefaultData>
<IdLocation>^guard.GlobalSnapshotD</IdLocation>
<IndexLocation>^guard.GlobalSnapshotI</IndexLocation>
<StreamLocation>^guard.GlobalSnapshotS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
