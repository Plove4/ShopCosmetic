using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopCosmetic.AppDateFile
{
    class DBcontext
    {
        private static KosmeticDBEntities _context { get; set; }

        public static KosmeticDBEntities Context
        {
            get
            {
                if (_context == null)
                    _context = new KosmeticDBEntities();
                return _context;
            }
        }
    }
}
