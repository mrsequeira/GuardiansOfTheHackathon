//namespace MvcFolhetos.Migrations
//{
//    using MvcFolhetos.Models;
//    using System;
//    using System.Data.Entity.Migrations;
//    using System.Linq;

//    public partial class Sequencefolhetos : DbMigration
//    {
//        // Adicionar uma sequ�ncia para obter IDs dos folhetos de forma
//        // at�mica.
//        public override void Up()
//        {
//            int maxIdFolheto = 0;

//            // Obter o �ltimo ID dos agentes, caso j� existam agentes na BD...
//            // Aqui � seguro fazer isto, a n�o ser que a BD esteja a ser usada
//            // por outra aplica��o.
//            using (var db = new ApplicationDbContext())
//            {
//                if (db.Folhetos.Any())
//                {
//                    maxIdFolheto = db.Folhetos.Max(x => x.FolhetosID) + 1;
//                }
//                else
//                {
//                    throw new Exception("N�o foram encontrados Folhetos...\n\nPor favor, comenta o c�digo todo deste ficheiro (est� na pasta das Migrations, Ctrl-A seguido de Ctrl-K e Ctrl-C), faz Update-Database, descomenta o c�digo, e faz Update-Database novamente.\n\nSorry! :(\n\n-Andr� Carvalho");
//                }
//            }

//            // Sequ�ncias s�o uma forma at�mica de obter n�meros a partir de uma BD.
//            // https://docs.microsoft.com/en-us/sql/t-sql/statements/create-sequence-transact-sql?view=sql-server-2017

//            // ATEN��O: S� estou a fazer concatena��o porque T-SQL (SQL do SQL Server) 
//            // n�o suporta parameters com comandos DDL!
//            // NUNCA se deve fazer concatena��o de strings com vari�veis
//            // quando se quer fazer uma query SQL, especialmente se os valores s�o user-provided!!!!
//            Sql(@"Create Sequence [dbo].[SeqIdFolheto] As Int Start With " + maxIdFolheto + ";");
//        }

//        // Se se fizer rollback a esta migra��o, apagar a sequ�ncia criada no upgrade (Up)
//        public override void Down()
//        {
//            Sql("Drop Sequence [dbo].[SeqIdFolheto]");
//        }
//    }
//}
