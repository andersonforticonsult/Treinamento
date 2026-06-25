Class Treinamento.Data.LogMensagem Extends (%Persistent, %XML.Adaptor)
{

Property Metodo As %String(MAXLEN = "") [ SqlColumnNumber = 2 ];

Property Classe As %String(MAXLEN = "") [ SqlColumnNumber = 3 ];

Property Inicio As %String [ SqlColumnNumber = 4 ];

Property Fim As %String [ SqlColumnNumber = 5 ];

Property Status As %Boolean [ SqlColumnNumber = 6 ];

Property StatusProcesso As %String(MAXLEN = "")[ SqlColumnNumber = 7 ];

Property ListaLog As list Of Treinamento.VO.LogMensagem;

ClassMethod CriarEntrada(pMetodo As %String, pClasse As %String) As Treinamento.Data.LogMensagem
{
    Set tSC = $$$OK 
    try
     {
       
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
ClassMethod Finalizar(pIdLog As %Integer, pStatusProcesso As %String = "", pstatusCode As %String) As Treinamento.Data.LogMensagem
{
    Set tSC = $$$OK
    try 
    {
        #Dim exception    As %Exception.General = ""
        #Dim statusCode   AS %Status           = $SYSTEM.Status.OK()
        #Dim entry        AS LogMensagem        = ..%OpenId(pIdLog)

        Set entry.Fim            = $ZDateTime($HOROLOG,4)
        Set entry.StatusProcesso = pStatusProcesso
        Set entry.Status         = pstatusCode
        Set statusLog            = entry.%Save()       
        

    }
    Catch(exception)
    {
        Set tSC           = exception.AsStatus()
        Set erroMensagem  = $SYSTEM.Status.GetOneErrorText(tSC)
        Throw exception
        
    }
    return entry
}
ClassMethod ConsultaLog(pStatus As %Boolean) As Treinamento.VO.LogMensagem
{
        #Dim StatusCode   As %Status            = $SYSTEM.Status.OK()
        #Dim exception    As %Exception.General = ""
        #Dim SQL          As %String
        #Dim resultSet    As %ResultSet 
        #Dim entry        AS LogMensagem        = ..%New()
   
    try
     {
        Set SQL = "SELECT * FROM Treinamento_Data.LogMensagem WHERE Status =  "_pStatus
        Set resultSet = ##class(%ResultSet).%New()
        Set statusCode = resultSet.Prepare(SQL)
        set statusCode = resultSet.Execute()
        if $System.Status.Error(statusCode) return statusCode
    
        While (resultSet.Next())
        {
            Set pItem = ##class(Treinamento.VO.LogMensagem).%New()
            Set pItem.Metodo          = resultSet.%Get("Metodo")     
            Set pItem.Classe          = resultSet.%Get("Classe")
            Set pItem.Inicio          = resultSet.%Get("Inicio")     
            Set pItem.Fim             = resultSet.%Get("Fim")
            Set pItem.Status          = resultSet.%Get("Status")     
            Set pItem.StatusProcesso  = resultSet.%Get("StatusProcesso")
            Do entry.ListaLog.Insert(pItem)
        }
     }
    catch(exception) 
    {
        Set tSC  = exception.AsStatus() 
        Set errorMensagem = $SYSTEM.Status.GetOneErrorText(tSC)
        Throw exception
    }   
    return entry   

}

ClassMethod ConsultaLogPaginacao(pStatus As %Boolean, pLastId As %Integer, pPageSize As %Integer, pDataFim As %String) As Treinamento.VO.LogMensagem
{
   Try 
    {   
     Set tSC = $$$OK      
        #Dim entry        AS LogMensagem        = ..%New()            
        Set SQL = "SELECT TOP "_pPageSize_" ID, Metodo, Classe, Inicio, Fim, Status, StatusProcesso  FROM Treinamento_Data.LogMensagem "
        Set SQL = SQL_"WHERE Status = "_pStatus 
        
        If (pLastId > 0) {
            Set SQL = SQL_" AND ID > "_pLastId
        }
        
        If (pDataFim '= "") {
            Set SQL = SQL_" AND Fim <= '"_pDataFim_"'"
        }
        
        Set SQL = SQL_" ORDER BY ID ASC"
        
        Set resultSet = ##class(%ResultSet).%New()
        Do resultSet.Prepare(SQL)
        Set tSC = resultSet.Execute()
        
       
        While (resultSet.Next())
        {
            
           Set pItem = ##class(Treinamento.VO.LogMensagem).%New()
            
            Set pItem.Metodo         = resultSet.%Get("Metodo")     
            Set pItem.Classe         = resultSet.%Get("Classe")
            Set pItem.Inicio         = resultSet.%Get("Inicio")     
            Set pItem.Fim            = resultSet.%Get("Fim")
            Set pItem.Status         = resultSet.%Get("Status")     
            Set pItem.StatusProcesso = resultSet.%Get("StatusProcesso")       
          
            Do entry.ListaLog.Insert(pItem)
        }
        
        
        Set totalPagina = entry.ListaLog.Count()
        If (totalPagina > 0) {
            Write "Total de logs encontrados por página: ", totalPagina, ! 
        } Else {
            Write "Nenhum log encontrado para essa pesquisa.", !
        }
    }
    Catch (exception)
    {
        Set tSC = exception.AsStatus()
        Set erroMensagem = $SYSTEM.Status.GetOneErrorText(tSC)
        Throw exception
    }
    
    Return entry
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
