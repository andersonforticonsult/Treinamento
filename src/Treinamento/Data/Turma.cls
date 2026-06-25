Class Treinamento.Data.Turma Extends (%Persistent, %XML.Adaptor)
{
    Property Instrutor As Treinamento.Data.Instrutor [ SqlColumnNumber = 2 ];

    Property DataInicio As %Date [ SqlColumnNumber = 3 ];

    Property Status As %String [ SqlColumnNumber = 4 ];

    Property Alunos As list Of Treinamento.Data.Aluno [ SqlColumnNumber = 5 ];

    Property Curso As Treinamento.Data.Curso [ SqlColumnNumber = 6 ];


 Method VerificaStatus(curso As %String) As %String 
 {
    Set status = $$$OK   
    Set Classe = $ZNAME
    Set core = ##class(Treinamento.Data.LogMensagem).%New()
    Set curso = "Obj Script"
    
  Try 
  {	   
        Set StatusTuma = "" 
        Set StatusProcesso = "Metodo VerificaStatus Foi executado com sucesso!"
        Set pStatus = 1
        Set init = core.CriarEntrada("VerificaStatus",Classe)
        Set IdLog = init.%Id()        
        
        Set SQL = "SELECT * FROM Treinamento_Data.Turma where Curso-> Nome = '"_curso_"'"        
        Set resultSet = ##class(%ResultSet).%New()         
        Set status = resultSet.Prepare(SQL)   
        Set status = resultSet.Execute()      
        
        if resultSet.Next()
        {
            Set StatusTuma = resultSet.Get("Status")
        }         
        Set fim = core.Finalizar(IdLog,StatusProcesso,pStatus)   
    
    }
    Catch ex 
    {
        Set status= ex.AsStatus()
        Set statusErroEspc = status
        Set erroMsg  = $SYSTEM.Status.GetOneErrorText(status)
        Set pStatus = 0
        Set erro     = "IdLog :"_IdLog_" - ErroLog :"_erroMsg_" Detalhes : "_statusErroEspc
        Set fim = core.Finalizar(IdLog,erro,pStatus)       
        Throw ex
    }
     Set fim = core.Finalizar(IdLog,erro,pStatus)            
  Return StatusTuma
 }
ClassMethod ImprimeTurma(curso As %String) As %Status
 {

    Set status = $$$OK   
    Set Classe = $ZNAME
    Set core = ##class(Treinamento.Data.LogMensagem).%New()   
     
    try 
    {
         Set StatusProcesso = "Metodo ImprimeTurma Foi executado com sucesso!"
         Set pStatus = 1
         Set init = core.CriarEntrada("ImprimeTurma",Classe)
         set IdLog = init.%Id()

        Set sql = "SELECT * FROM Treinamento_Data.Turma where Curso-> Nome = '"_curso_"'"
        set resultSet = ##class(%ResultSet).%New()
        
        Set status = resultSet.Prepare(sql)
        if $SYSTEM.Status.IsError(status) return status

        Set status = resultSet.Execute()
        

        If resultSet.%Next()
        {
            Set idTurma = resultSet.%Get("ID") 
            Set turma= ##class(Treinamento.Data.Turma).%OpenId(idTurma)
        }
        For i=1:1:turma.Alunos.Count()
            {
                Set aluno = turma.Alunos.GetAt(i)
                W "Nome " _ aluno.Nome, " Matricula: "_aluno.Matricula, " Idade: "_aluno.Idade, !
            }     
    
    } 
    catch ex 
    {
      Set status = ex.AsStatus()
      Set statusErroEspc = status
      Set erroMsg  = $SYSTEM.Status.GetOneErrorText(status)
      Set pStatus = 0
      set erro    = "IdLog :"_IdLog_" - ErroLog :"_erroMsg_" Detalhes : "_statusErroEspc
      Set fim = core.Finalizar(IdLog,erro,pStatus)
      Throw ex    
    }
    Set fim = core.Finalizar(IdLog,StatusProcesso,pStatus)
    return 
 }

Storage Default
{
<Data name="TurmaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Instrutor</Value>
</Value>
<Value name="3">
<Value>DataInicio</Value>
</Value>
<Value name="4">
<Value>Status</Value>
</Value>
<Value name="5">
<Value>Alunos</Value>
</Value>
<Value name="6">
<Value>Curso</Value>
</Value>
</Data>
<DataLocation>^Treinamento.Data.TurmaD</DataLocation>
<DefaultData>TurmaDefaultData</DefaultData>
<IdLocation>^Treinamento.Data.TurmaD</IdLocation>
<IndexLocation>^Treinamento.Data.TurmaI</IndexLocation>
<StreamLocation>^Treinamento.Data.TurmaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
