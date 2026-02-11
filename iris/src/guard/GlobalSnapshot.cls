Class guard.GlobalSnapshot Extends %Persistent
{

Property SnapshotDate As %Date [ Required ];

Index IdxSnapshotDate On SnapshotDate;

Property GlobalName As %String(MAXLEN = 255) [ Required ];

Index IdxGlobalName On GlobalName;

Index IdxGlobalTime On (GlobalName, SnapshotDate);

Property Location As %String(MAXLEN = 128);

Index IdxLocation On Location;

Index IdxLocationTime On (Location, SnapshotDate);

Index IdxGlobalLocation On (GlobalName, Location);

Property AllocatedMB As %Decimal;

Property UsedMB As %Decimal;

Property Tables As %List;

Property PrevSnapshotId As %Integer;

Property GrowthMB As %Decimal;

Property GrowthPct As %Decimal;

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
