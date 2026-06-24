Class Treinamento.VO.LogMensagem Extends (%Persistent, %XML.Adaptor)
{

Property Metodo As %String;

Property Classe As %TimeStamp;

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
<Value>Metodo</Value>
</Value>
<Value name="3">
<Value>Classe</Value>
</Value>
<Value name="4">
<Value>Fim</Value>
</Value>
<Value name="5">
<Value>Status</Value>
</Value>
<Value name="6">
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
