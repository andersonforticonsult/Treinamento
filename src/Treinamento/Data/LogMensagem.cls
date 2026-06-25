Class Treinamento.Data.LogMensagem Extends (%Persistent, %XML.Adaptor)
{

Property Metodo As %String(MAXLEN = "") [ SqlColumnNumber = 2 ];

Property Classe As %String(MAXLEN = "") [ SqlColumnNumber = 3 ];

Property Inicio As %String [ SqlColumnNumber = 4 ];

Property Fim As %String [ SqlColumnNumber = 5 ];

Property Status As %Boolean [ SqlColumnNumber = 6 ];

Property StatusProcesso As %String [ SqlColumnNumber = 7 ];

Property ListaLog As list Of Treinamento.VO.LogMensagem;

ClassMethod CriarEntrada(pMetodo As %String, pClasse As %String) As Treinamento.Data.LogMensagem
{
    Set tSC = $$$OK 
    try
     {
        #; Set classe                   = ..%ClassName()
        #; Set name                     =   $ZNAME
        #Dim exception               As %Exception.General = ""
        #Dim statuCode               As %Status            = $SYSTEM.Status.OK()
        #Dim entry                   As LogMensagem        = ..%New()
        

        Set entry.Metodo                = pMetodo
        Set entry.Classe                = pClasse
        Set entry.Inicio                = $ZDATETIME($HOROLOG,4)
        set entry.Status                = statuCode
        SET statusCode                  = entry.%Save()
    }
    catch(exception) 
    {
        Set tSC  = exception.AsStatus() 
        Set errorMensagem = $SYSTEM.Status.GetOneErrorText(tSC)
        Throw exception
    }   

    return entry

}
ClassMethod Finalizar(pIdLog As %Integer, pStatusProcesso As %String, pStatusCode As %String) As Treinamento.Data.LogMensagem
{
    Set tSC = $$$OK 
    try
     {
        
        #Dim exception               As %Exception.General = ""
        #Dim statuCode               As %Status            = $SYSTEM.Status.OK()
        #Dim entry                   As LogMensagem        = ..%OpenId(pIdLog)
        

        Set entry.Fim                  =  $ZDATETIME($HOROLOG,4)
        Set entry.StatusProcesso        = pStatusProcesso        
        set entry.Status                = statuCode
        SET statusCode                  = entry.%Save()
    }
    catch(exception) 
    {
        Set tSC  = exception.AsStatus() 
        Set errorMensagem = $SYSTEM.Status.GetOneErrorText(tSC)
        Throw exception
    }   

    return entry

}


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
