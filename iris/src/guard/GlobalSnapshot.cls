Class guard.GlobalSnapshot Extends %Persistent
{

/// Name of the global (e.g. ^Orders)
Property GlobalName As %String(MAXLEN = 255);

/// Exact timestamp when the snapshot was collected
Property SnapshotTS As %TimeStamp [ Required ];

Index IdxGlobalTime On (GlobalName, SnapshotTS);

/// Namespace where the global is defined
Property Namespace As %String(MAXLEN = 64);

/// IRIS database name where the global is stored
Property DatabaseName As %String(MAXLEN = 128);

/// Total number of nodes in the global
Property NodeCount As %BigInt;

/// Estimated size of the global in bytes
Property SizeBytes As %BigInt;

/// Maximum depth of the global tree
Property MaxDepth As %Integer;

/// Average size of values stored in the global
Property AvgValueSize As %Integer;

/// Reference to the previous snapshot of the same global
Property PrevSnapshotId As %BigInt;

/// Absolute growth in number of nodes since last snapshot
Property GrowthNodes As %BigInt;

/// Absolute growth in bytes since last snapshot
Property GrowthBytes As %BigInt;

/// Percentage growth compared to the previous snapshot
Property VariationPct As %Decimal;

/// Growth rate (e.g. nodes per day)
Property GrowthRate As %Decimal;

/// List of SQL tables mapped to or using this global
Property Tables As list Of %String;

Storage Default
{
<Data name="GlobalSnapshotDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>GlobalName</Value>
</Value>
<Value name="3">
<Value>SnapshotTS</Value>
</Value>
<Value name="4">
<Value>Namespace</Value>
</Value>
<Value name="5">
<Value>DatabaseName</Value>
</Value>
<Value name="6">
<Value>NodeCount</Value>
</Value>
<Value name="7">
<Value>SizeBytes</Value>
</Value>
<Value name="8">
<Value>MaxDepth</Value>
</Value>
<Value name="9">
<Value>AvgValueSize</Value>
</Value>
<Value name="10">
<Value>PrevSnapshotId</Value>
</Value>
<Value name="11">
<Value>GrowthNodes</Value>
</Value>
<Value name="12">
<Value>GrowthBytes</Value>
</Value>
<Value name="13">
<Value>VariationPct</Value>
</Value>
<Value name="14">
<Value>GrowthRate</Value>
</Value>
<Value name="15">
<Value>Tables</Value>
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
