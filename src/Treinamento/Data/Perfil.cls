Class Treinamento.Data.Perfil Extends (%Persistent, %XML.Adaptor)
{

Property NomePerfil As %String(MAXLEN = "") [ SqlColumnNumber = 2 ];

Property Codigo As %String [ SqlColumnNumber = 3 ];

Property Perfil As %String [ SqlColumnNumber = 4 ];

Relationship Usuarios As Treinamento.Data.Usuario [ Cardinality = many, Inverse = Perfil ];

/// Description
Relationship Nivel As Treinamento.Data.Nivel [ Cardinality = one, Inverse = Perfis ];



Storage Default
{
<Data name="PerfilDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>NomePerfil</Value>
</Value>
<Value name="3">
<Value>Codigo</Value>
</Value>
<Value name="4">
<Value>Perfil</Value>
</Value>
<Value name="5">
<Value>Nivel</Value>
</Value>
</Data>
<DataLocation>^Treinamento.Data.PerfilD</DataLocation>
<DefaultData>PerfilDefaultData</DefaultData>
<IdLocation>^Treinamento.Data.PerfilD</IdLocation>
<IndexLocation>^Treinamento.Data.PerfilI</IndexLocation>
<StreamLocation>^Treinamento.Data.PerfilS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
