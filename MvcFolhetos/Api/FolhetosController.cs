using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using MvcFolhetos.Models;
using WebAPI.ApiViewModels;

namespace WebAPI.Api
{
    // Controller API dos folhetos
    [RoutePrefix("api/folhetos")]
    public class FolhetosController : ApiController
    {
        #region Base de dados

        // Referência para a base de dados.
        private ApplicationDbContext db = new ApplicationDbContext();

        #endregion

        #region CRUD: "Read" de folhetos

        // GET: /api/folhetos
        public IHttpActionResult GetFolhetos()
        {
            // diff entre usar assim ou apenas db.Folhetos?? -----
            IQueryable<Folhetos> query = db.Folhetos;

            // Uso do Select para prevenir referências circulares.
            var resultado = query
                .Select(folheto => new //Uso do operador Select para prevenir referências circulares
                {
                    folheto.FolhetosID,
                    folheto.Titulo,
                    folheto.Descricao,
                    folheto.DataInic,
                    folheto.DataFim,
                    folheto.NomeEmpresa,
                })
                .ToList();

            return Ok(resultado);
        }

        //********************************* RESOLVER PROBLEMA REFERENCES **
        // GET: api/Folhetos/5
        [ResponseType(typeof(Folhetos))]
        public IHttpActionResult GetFolhetos(int id)
        {
            IQueryable<Folhetos> query = db.Folhetos;

            //Folhetos folhetos = db.Folhetos.Find(id);

            // Nota: Cuidado que aqui também pode ocorrer o problema das referências
            // circulares! Fica como exercício para casa...
            // Não precisam do Select aqui (Linq é só para listas),
            // por isso seria algo como

            //var resultado = query.Equals( Folhetos.FolhetosID, id)
                
            
            //var resultado = new { query => query.FolhetosID == id };
            var resultado = query
                .Where( folheto=> folheto.FolhetosID == id );

            if (resultado == null)
            {
                return NotFound();
            }

            return Ok(resultado);
        }
      
        //Obtem tags associadas ao folheto através do id passado
        // GET: api/id/Tags
        [HttpGet, Route("{id}/Tags")]
        public IHttpActionResult GetFolhetosByTags(int id)
        {
            Folhetos folhetos = db.Folhetos.Find(id);

            if (folhetos == null)
            {
                return NotFound();
            }

            var resultado = folhetos.ListaDeTags
                .Select(tags => new
                {
                    tags.ID,
                    tags.Info,
                })
                .ToList();

            return Ok(resultado);
        }
        
        #endregion


        #region CRUD: Criação de folhetos

        // POST: api/Folhetos
        [ResponseType(typeof(Folhetos))]
        public IHttpActionResult PostFolhetos(CreateFolhetoViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var folhetos = new Folhetos
            {
                FolhetosID = db.GetIdFolheto(),
                Titulo = model.Titulo,
                Descricao = model.Descricao,
                DataInic = model.DataInic,
                DataFim = model.DataFim,
                NomeEmpresa = model.NomeEmpresa
            };

            db.Folhetos.Add(folhetos);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                // Seria muito provável que o método
                // db.Agentes.Max(agente => agente.ID) + 1
                // fizesse com que este if resultasse no Conflict (HTTP 409).
                // Função criado pelo template
                if (FolhetosExists(folhetos.FolhetosID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = folhetos.FolhetosID }, folhetos);
        }

        #endregion


        #region CRUD: Update de folhetos

        // O uso do [FromBody] e [FromUri] é para "desambiguar" e ajudar a Web API
        // a distinguir de onde é que devem vir os valores dos campos.
        // PUT: api/Folhetos/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutFolhetos([FromUri] int id, [FromBody]  Folhetos folhetos)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != folhetos.FolhetosID)
            {
                return BadRequest();
            }

            db.Entry(folhetos).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FolhetosExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        #endregion


        #region CRUD: Delete de folhetos

        // DELETE: api/Folhetos/5
        [ResponseType(typeof(Folhetos))]
        public IHttpActionResult DeleteFolhetos(int id)
        {
            Folhetos folhetos = db.Folhetos.Find(id);
            if (folhetos == null)
            {
                return NotFound();
            }

            db.Folhetos.Remove(folhetos);
            db.SaveChanges();

            return Ok(folhetos);
        }

        #endregion

        // Fecha a ligação à base de dados.
        // Este método é chamado pela framework ASP.NET automáticamente,
        // por isso não precisam de o fazer.
        // Nota: quando se criam objetos que usam coisas como BDs, sockets,
        // ou ficheiros, em .net, implementa-se a interface IDisposable.
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        // Função criada pelo template que verifica se já
        // existe um folheto com um determinado ID.
        private bool FolhetosExists(int id)
        {
            return db.Folhetos.Count(e => e.FolhetosID == id) > 0;
        }

    }
}