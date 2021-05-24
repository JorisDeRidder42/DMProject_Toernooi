using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace DeRidderJoris_GRPLTId1._1_DM_DAL
{
    public static class DatabaseOperations
    {
        // filteren van de database op gamemode enkel de toernooien van gekozen spel worden getoond
        //filteren op datum?
        public static GameMode OphalenGekozenSpel()

        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.GameMode
                    .Where(t => t.gameModeNaam == Helper.buttonSpel)
                    .Include(t => t.Toernooien)
                  .SingleOrDefault();
            }   
        }


        public static List<Toernooi> OphalenGekozenSpelViaToernooiId()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiId == Helper.IdGame)
                    .Include(t => t.GameMode)
                    .OrderBy(t => t.datum)
                  .ToList();
            }
        }


        //id ophalen van gekozen toernooi en de gegevens van dat toernooi plaatsen in labels
        public static Toernooi OphalenWedstrijdId()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiId == Helper.IdGame)
                    .SingleOrDefault();
            }
        }

        //afbeelding tonen d.m.v gamemodeid
        public static Toernooi OphalenImageMetId()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiId == Helper.IdGame)
                    .SingleOrDefault();
            }
        }

        //ophalen id van 1 game met alle ranks in combobox
        public static List<Rank> OphalenToernooiMetRanks()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Rank
                    .Include(t => t.GameModeRanks)
                    //filteren op gameModeId == enkel gekozen spel daar ranks van tonen
                    .ToList();
            }
        }
        public static List<Prijs> OphalenPrijzen()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Prijs
                .Include(p => p.ToernooiPrijs)
                //filteren op toernooiId == enkel gekozen toernooi daar de prijzen van tonen
                .ToList();
            }
        }

        public static int ToevoegenSpeler(Speler speler)
        {
            try
            {
                using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
                {

                    toernooiEntities.Speler.Add(speler);
                    return toernooiEntities.SaveChanges();

                }
            }
            catch (Exception ex)
            {
                FileOperations.FoutLoggen(ex);
                return 0;
            }
        }


        public static int VerwijderenToernooi(Toernooi toernooi)
        {
            try
            {
                using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
                {

                    toernooiEntities.Entry(toernooi).State = EntityState.Deleted;
                    return toernooiEntities.SaveChanges();

                }
            }
            catch (Exception ex)
            {
                FileOperations.FoutLoggen(ex);
                return 0;
            }
        }
    }
}
