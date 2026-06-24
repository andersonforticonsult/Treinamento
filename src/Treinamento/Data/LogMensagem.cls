Class Treinamento.Data.LogMensagem Extends (%Persistent, %XML.Adaptor)
{

 property Metodo As %String(MAXLEN = "") [ SqlColumnNumber = 2 ];

 property Classe As %String (MAXLEN = "")[ SqlColumnNumber = 3 ];

 property Inicio As %String [ SqlColumnNumber = 4 ];

 property Fim As %String [ SqlColumnNumber = 5 ];

 property Status As %Boolean [ SqlColumnNumber = 6 ];

 property StatusProcesso As %String [ SqlColumnNumber = 7 ];

property ListaLog As list Of Treinamento.VO.LogMensagem;



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
<Value>Inicio</Value>
</Value>
<Value name="5">
<Value>Fim</Value>
</Value>
<Value name="6">
<Value>Status</Value>
</Value>
<Value name="7">
<Value>StatusProcesso</Value>
</Value>
<Value name="8">
<Value>ListaLog</Value>
</Value>
</Data>
<DataLocation>^Treinamento.Data.LogMensagemD</DataLocation>
<DefaultData>LogMensagemDefaultData</DefaultData>
<IdLocation>^Treinamento.Data.LogMensagemD</IdLocation>
<IndexLocation>^Treinamento.Data.LogMensagemI</IndexLocation>
<StreamLocation>^Treinamento.Data.LogMensagemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
