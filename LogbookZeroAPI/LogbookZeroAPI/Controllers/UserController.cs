using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using LogbookZeroAPI.Models;

namespace LogbookZeroAPI.Controllers
{
    [RoutePrefix("api/User")]
    public class UserController : ApiController
    {
        // GET api/User
        [HttpGet]
        public IEnumerable<User> Get()
        {
            using (LogbookZeroEntities2 entities = new LogbookZeroEntities2())
            {
                return entities.Users.ToList();
            }
        }

        // Get api/User/?email={email}
        [HttpGet]
        public IHttpActionResult Get([FromUri] String email)
        {
            using (LogbookZeroEntities2 entities = new LogbookZeroEntities2())
            {
                var user = entities.Users.ToList().FirstOrDefault((p) => p.Email == email);

                if (user == null)
                {
                    return NotFound();
                }
                
                return Ok(user);
            }
        }

        [HttpPost]
        public IHttpActionResult Post([FromUri] String email, [FromUri] String password, [FromUri] String firstName, [FromUri] String lastName)
        {
            if (email == null || password == null)
            {
                return StatusCode(HttpStatusCode.NoContent);
            }

            using (LogbookZeroEntities2 entities = new LogbookZeroEntities2())
            {
                if (!entities.Users.ToList().Any(x => x.Email == email && x.Pass == password))
                {
                    entities.Users.Add(new User()
                    {
                        Email = email,
                        Pass = password,
                        FirstName = firstName,
                        LastName = lastName
                    });

                    entities.SaveChanges();
                }
                else
                {
                    return StatusCode(HttpStatusCode.Conflict);
                }
            }
            return StatusCode(HttpStatusCode.Created);
        }
    }
}
