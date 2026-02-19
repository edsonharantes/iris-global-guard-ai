Class guard.GlobalGrowthProfile Extends %Persistent
{

Property GlobalName As %String;

Property Location As %String;

Property WindowDays As %Integer;

Property FromDate As %DateTime;

Property ToDate As %DateTime;

Property AVGMon As %String;

Property AVGTue As %String;

Property AVGWed As %String;

Property AVGThu As %String;

Property AVGFri As %String;

Property AVGSat As %String;

Property AVGSun As %String;

Property WeeklyVector As %Vector(DATATYPE = "DOUBLE", LEN = 7);

Storage Default
{
<Data name="GlobalGrowthProfileDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>GlobalName</Value>
</Value>
<Value name="3">
<Value>Location</Value>
</Value>
<Value name="4">
<Value>WindowDays</Value>
</Value>
<Value name="5">
<Value>FromDate</Value>
</Value>
<Value name="6">
<Value>ToDate</Value>
</Value>
<Value name="7">
<Value>AVGMon</Value>
</Value>
<Value name="8">
<Value>AVGTue</Value>
</Value>
<Value name="9">
<Value>AVGWed</Value>
</Value>
<Value name="10">
<Value>AVGThu</Value>
</Value>
<Value name="11">
<Value>AVGFri</Value>
</Value>
<Value name="12">
<Value>AVGSat</Value>
</Value>
<Value name="13">
<Value>AVGSun</Value>
</Value>
<Value name="14">
<Value>WeeklyVector</Value>
</Value>
</Data>
<DataLocation>^guard.GlobalGrowthProfileD</DataLocation>
<DefaultData>GlobalGrowthProfileDefaultData</DefaultData>
<IdLocation>^guard.GlobalGrowthProfileD</IdLocation>
<IndexLocation>^guard.GlobalGrowthProfileI</IndexLocation>
<StreamLocation>^guard.GlobalGrowthProfileS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
