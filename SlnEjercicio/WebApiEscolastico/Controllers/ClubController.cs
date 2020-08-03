using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using BEUEjercicio;
using BEUEjercicio.Transactions;

namespace WebApiEscolastico.Controllers
{
    public class ClubController : ApiController
    {
        private Entities db = new Entities();

        // GET: api/Club
        public IQueryable<Club> GetClubs()
        {
            return ClubBLL.Get();
        }

        // GET: api/Club/5
        [ResponseType(typeof(Club))]
        public async Task<IHttpActionResult> GetClub(int id)
        {
            Club club = ClubBLL.Get(id);
            if (club == null)
            {
                return NotFound();
            }

            return Ok(club);
        }

        // PUT: api/Club/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutClub(int id, Club club)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != club.id_club)
            {
                return BadRequest();
            }

            ClubBLL.Update(club);

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Club
        [ResponseType(typeof(Club))]
        public async Task<IHttpActionResult> PostClub(Club club)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            ClubBLL.Create(club);

            return CreatedAtRoute("DefaultApi", new { id = club.id_club }, club);
        }

        // DELETE: api/Club/5
        [ResponseType(typeof(Club))]
        public async Task<IHttpActionResult> DeleteClub(int id)
        {
            Club club = ClubBLL.Get(id);
            if (club == null)
            {
                return NotFound();
            }

            ClubBLL.Delete(id);

            return Ok(club);
        }
    }
}