Class Treinamento.VO.LogMensagem Extends (%Persistent, %XML.Adaptor)
{
 Property ID As %String;

Property Metodo As %String;

Property Classe As %TimeStamp;
Property Inicio As %String;

Property Fim As %String;

Property Status As %Boolean;

Property StatusProcesso As %String;



Storage Default
{
<Data name="LogMensagemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ID</Value>
</Value>
<Value name="3">
<Value>Metodo</Value>
</Value>
<Value name="4">
<Value>Classe</Value>
</Value>
<Value name="5">
<Value>Inicio</Value>
</Value>
<Value name="6">
<Value>Fim</Value>
</Value>
<Value name="7">
<Value>Status</Value>
</Value>
<Value name="8">
<Value>StatusProcesso</Value>
</Value>
</Data>
<DataLocation>^Treinamento.VO.LogMensagemD</DataLocation>
<DefaultData>LogMensagemDefaultData</DefaultData>
<IdLocation>^Treinamento.VO.LogMensagemD</IdLocation>
<IndexLocation>^Treinamento.VO.LogMensagemI</IndexLocation>
<StreamLocation>^Treinamento.VO.LogMensagemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
