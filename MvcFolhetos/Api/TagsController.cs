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
    // Controller API das tags
    [RoutePrefix("api/tags")]
    public class TagsController : ApiController
    {
        #region Base de dados

        private ApplicationDbContext db = new ApplicationDbContext();

        #endregion


        #region CRUD: "Read" de Tags 

        // GET: api/Tags
        public IHttpActionResult GetTags()
        {
            IQueryable<Tags> query = db.Tags;

            // Uso do Select para prevenir referências circulares.
            var resultado = query
                .Select(tags => new //Uso do operador Select para prevenir referências circulares
                {
                    tags.ID,
                    tags.Info,
                })
                .ToList();

            return Ok(resultado);
        }

        // GET: api/Tags/5
        [ResponseType(typeof(Tags))]
        public IHttpActionResult GetTags(int id)
        {
            IQueryable<Tags> query = db.Tags;

            Tags tags = db.Tags.Find(id);

            var resultado = new
            {
                tags.ID,
                tags.Info,
            };

            if (resultado == null)
            {
                return NotFound();
            }

            return Ok(resultado);
        }

        #endregion


        #region CRUD: "update" de Tags 
        // PUT: api/Tags/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTags([FromUri] int id, [FromBody]  Tags tags)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tags.ID)
            {
                return BadRequest();
            }

            db.Entry(tags).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TagsExists(id))
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

        #region CRUD: "create" de Tags 

        // POST: api/Tags
        [ResponseType(typeof(Tags))]
        public IHttpActionResult PostTags(CreateTagsViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var tags = new Tags
            {
                Info = model.Info
            };
            db.Tags.Add(tags);
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
                if (TagsExists(tags.ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = tags.ID }, tags);
        }

        #endregion

        #region CRUD: "delete" de Tags 

        // DELETE: api/Tags/5
        [ResponseType(typeof(Tags))]
        public IHttpActionResult DeleteTags(int id)
        {
            Tags tags = db.Tags.Find(id);
            if (tags == null)
            {
                return NotFound();
            }

            db.Tags.Remove(tags);
            db.SaveChanges();

            return Ok(tags);
        }
        #endregion

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TagsExists(int id)
        {
            return db.Tags.Count(e => e.ID == id) > 0;
        }
    }
}