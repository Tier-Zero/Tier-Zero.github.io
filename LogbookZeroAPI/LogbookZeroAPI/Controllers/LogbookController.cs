using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using LogbookZeroAPI.Models;
using System.Web.Http;

namespace LogbookZeroAPI.Controllers
{
    [RoutePrefix("api/Logbook")]
    public class LogbookController : ApiController
    {
        [HttpGet]
        public IEnumerable<LogItem> Get()
        {
            using (LogbookZeroEntities4 entities = new LogbookZeroEntities4())
            {
                return entities.LogItems.ToList();
            }
        }
    }
}
