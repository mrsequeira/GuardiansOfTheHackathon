namespace MvcFolhetos.Migrations
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using MvcFolhetos.Models;

    internal sealed class Configuration : DbMigrationsConfiguration<MvcFolhetos.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            ContextKey = "MvcFolhetos.Models.ApplicationDbContext ";
        }

        protected override void Seed(MvcFolhetos.Models.ApplicationDbContext context)
        {
            #region Adiciona Tags
            var tags = new List<Tags> {
               new Tags {ID =1, Info ="Antevis�o" },
               new Tags {ID =2, Info ="Dia da m�e" },
               new Tags {ID =3, Info ="Descontos" },
               new Tags {ID =4, Info ="S� hoje" },
               new Tags {ID =5, Info ="Toda a noite" },
               new Tags {ID =6, Info ="Antevis�es da semana" },
               new Tags {ID =7, Info ="Descontos" },
               new Tags {ID =8, Info ="Esta semana" },
               new Tags {ID =9, Info ="Promo��es descontos" },
               new Tags {ID =10, Info ="Nacional" }
            };
            tags.ForEach(tt => context.Tags.AddOrUpdate(t => t.ID, tt));
            try
            {
                context.SaveChanges();
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
            {
                Exception raise = dbEx;
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        string message = string.Format("{0}:{1}",
                            validationErrors.Entry.Entity.ToString(),
                            validationError.ErrorMessage);
                        // raise a new exception nesting
                        // the current instance as InnerException
                        raise = new InvalidOperationException(message, raise);
                    }
                }
                throw raise;
            }

            #endregion

            #region Adiciona Categorias
            var categorias = new List<Categorias> {
               new Categorias {ID =1, Nome ="Supermercado"  },
               new Categorias {ID =2, Nome ="Roupa"  },
               new Categorias {ID =3, Nome ="Tecnologia" },
               new Categorias {ID =4, Nome ="Livros" },
               new Categorias {ID =5, Nome ="Casa e Docra��o" }
            };
            categorias.ForEach(ll => context.Categorias.AddOrUpdate(l => l.ID, ll));
            try
            {
                context.SaveChanges();
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
            {
                Exception raise = dbEx;
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        string message = string.Format("{0}:{1}",
                            validationErrors.Entry.Entity.ToString(),
                            validationError.ErrorMessage);
                        // raise a new exception nesting
                        // the current instance as InnerException
                        raise = new InvalidOperationException(message, raise);
                    }
                }
                throw raise;
            }
            #endregion

            #region Adiciona Folhetos
            var folhetos = new List<Folhetos> {
               new Folhetos {
                    FolhetosID =1,
                    Titulo ="Antevis�o Folheto PINGO DOCE Promo��es de 1 a 7 maio ",
                    Descricao ="S� come�a a 1 maio, mas como sempre em primeira m�o no Blog!",
                    DataInic =new DateTime(2018,5,1),
                    DataFim =new DateTime(2018,5,7),
                    ListaDeTags = new List<Tags>{ tags[0] },
                    NomeEmpresa="Pingo Doce",
                    ListaDeCategorias = new List<Categorias>{ categorias[0] }
               },
               new Folhetos {
                    FolhetosID =2,
                    Titulo ="Antevis�o - 1 Maio PINGO DOCE s� amanh� 25% em toda a loja",
                    Descricao ="Ora sempre se confirma o antecipado logo pela manh� de hoje AQUI, assim amanh� 1 maio teremos 25% de desconto em cart�o Poupa Mais em toda loja Pingo Doce, o desconto acumula com as demais promo��es, assim e de  forma a maximizar os descontos, consultem todos os folhetos abaixo, e o especial 1 maio, para verificarem as vossas necessidades e oportunidades, desejo um bom 1 de maio para todos, especialmente para os que neste dia feriado est�o a trabalhar !",
                    DataInic =new DateTime(2018,5,1),
                    DataFim =new DateTime(2018,5,1),
                    NomeEmpresa="Pingo Doce",
                    ListaDeTags = new List<Tags>{ tags[0], tags[1], tags[2] },
                    ListaDeCategorias = new List<Categorias>{ categorias[1] }
               },
               new Folhetos {
                    FolhetosID =3,
                    Titulo ="Destaques e S� hoje! ",
                    Descricao ="Destaques e S� hoje! Continente especial 1 maio - s� 1 maio,",
                    DataInic =new DateTime(2018,5,1),
                    DataFim =new DateTime(2018,5,1),
                    NomeEmpresa="Continente",
                    ListaDeTags = new List<Tags>{ tags[3] },
                    ListaDeCategorias = new List<Categorias>{ categorias[2] }
               },
                new Folhetos {
                    FolhetosID =4,
                    Titulo ="Antevis�o PINGO DOCE Promo��es extra de 29 abril a 1 maio",
                    Descricao ="Sempre em primeira m�o ! Aqui est� o t�o esperado 1 maio do Pingo Doce !",
                    DataInic =new DateTime(2018,4,29),
                    DataFim =new DateTime(2018,5,1),
                    NomeEmpresa ="PingoDoce",
                    ListaDeTags = new List<Tags>{ tags[3] },
                    ListaDeCategorias = new List<Categorias>{ categorias[2] }
                },
               new Folhetos {
                    FolhetosID =5,
                    Titulo ="Antevis�o Folheto PINGO DOCE Frescos promo��es de 1 a 31 maio,",
                    Descricao ="Antevis�o Folheto PINGO DOCE Frescos promo��es de 1 a 31 maio,",
                    DataInic =new DateTime(2018,5,1),
                    DataFim =new DateTime(2018,5,31),
                    NomeEmpresa ="PingoDoce",
                    ListaDeTags = new List<Tags>{ tags[3] },
                    ListaDeCategorias = new List<Categorias>{ categorias[2] }
               },
               new Folhetos {
                    FolhetosID =6,
                    Titulo ="Antevis�o Folheto CODE - PINGO DOCE  Dia da m�e promo��es at� 6 maio,",
                    Descricao ="Antevis�o Folheto CODE - PINGO DOCE  Dia da m�e promo��es at� 6 maio,",
                    DataInic =new DateTime(2018,5,3), DataFim=new DateTime(2018,5,6),
                    NomeEmpresa ="CODE-PingoDoce",
                    ListaDeTags = new List<Tags>{ tags[3] },
                    ListaDeCategorias = new List<Categorias>{ categorias[2] }
               },
               new Folhetos {
                    FolhetosID =7,
                    Titulo ="Antevis�o Folheto CONTINENTE Promo��oz�o de 2 a 7 maio,",
                    Descricao ="Antevis�o Folheto CONTINENTE Promo��oz�o de 2 a 7 maio,",
                    DataInic =new DateTime(2018,5,2), DataFim=new DateTime(2018,5,7),
                    NomeEmpresa ="Continente",
                    ListaDeTags = new List<Tags>{ tags[3] },
                    ListaDeCategorias = new List<Categorias>{ categorias[2] }
               },
               new Folhetos {
                    FolhetosID =8,
                    Titulo ="Antevis�o folheto MINIPRE�O Nacional promo��es de 3 a 9 maio,",
                    Descricao ="Antevis�o folheto MINIPRE�O Nacional promo��es de 3 a 9 maio,",
                    DataInic =new DateTime(2018,5,3),
                    DataFim =new DateTime(2018,5,9),
                    NomeEmpresa ="Minipre�o",
                    ListaDeTags = new List<Tags>{ tags[3] },
                    ListaDeCategorias = new List<Categorias>{ categorias[2] }

               },
               new Folhetos {
                    FolhetosID =9,
                    Titulo ="Antevis�o Folheto JUMBO Promo��es de 2 a 10 maio",
                    Descricao ="Antevis�o Folheto JUMBO Promo��es de 2 a 10 maio",
                    DataInic =new DateTime(2018,5,2),
                    DataFim =new DateTime(2018,5,10),
                    NomeEmpresa ="Jumbo",
                    ListaDeTags = new List<Tags>{ tags[3] },
                    ListaDeCategorias = new List<Categorias>{ categorias[2] }
               },
               new Folhetos {FolhetosID=10,
                    Titulo ="Antevis�o Folheto INTERMARCH� Promo��es de 3 a 9 maio",
                    Descricao ="Antevis�o Folheto INTERMARCH� Promo��es de 3 a 9 maio",
                    DataInic =new DateTime(2018,5,3),
                    DataFim =new DateTime(2018,5,3),
                    NomeEmpresa ="Intermarch�",
                    ListaDeTags = new List<Tags>{ tags[3] },
                    ListaDeCategorias = new List<Categorias>{ categorias[2] }
               }

            };
            folhetos.ForEach(ff => context.Folhetos.AddOrUpdate(f => f.FolhetosID, ff));
            try
            {
                context.SaveChanges();
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
            {
                Exception raise = dbEx;
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        string message = string.Format("{0}:{1}",
                            validationErrors.Entry.Entity.ToString(),
                            validationError.ErrorMessage);
                        // raise a new exception nesting
                        // the current instance as InnerException
                        raise = new InvalidOperationException(message, raise);
                    }
                }
                throw raise;
            }
            #endregion
        }
    }
}
