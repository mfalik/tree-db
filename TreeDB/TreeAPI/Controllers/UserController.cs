using Microsoft.AspNetCore.Mvc;

namespace TreeAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController : ControllerBase
    {
        [HttpGet]
        public User Get()
        {
            return new User() { Email="some.user@something.com", FirstName="Some", LastName="User", Location="Earth", UserName="CoolUser123"};
        }
    }
}
