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
        public static GameMode OphalenGekozenSpel()

        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.GameMode
                    .Where(t => t.gameModeNaam == Helper.buttonSpel)
                    .Include(t => t.Toernooien)
                    //.OrderBy(t => t.Toernooien)
                    //.ThenBy(t => t.Toernooien.Select(sub => sub.datum))
                    //.OrderBy(t =>t.Toernooien.Select(sub => sub.datum))
                  .SingleOrDefault();
            }   
        }


        public static List<Toernooi> OphalenGekozenSpelViaToernooiId()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiId == Helper.IdToernooi)
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
                    .Where(t => t.toernooiId == Helper.IdToernooi)
                    .SingleOrDefault();
            }
        }

        //afbeelding tonen d.m.v gamemodeid
        public static Toernooi OphalenImageMetId()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiId == Helper.IdToernooi)
                    .SingleOrDefault();
            }
        }

        //ophalen id van 1 game met alle ranks in combobox
        public static GameMode OphalenToernooiMetRanks()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                //filteren op GameModeId == enkel gekozen GameMode daar de Ranks van tonen
                var query = toernooiEntities.GameMode
                    .Where(r => r.gameModeId == Helper.IdGameMode)
                    .Include(r => r.GameModeRanks.Select(sub => sub.Rank));
                return query.SingleOrDefault();
            }
        }

        //filteren op toernooiId == enkel gekozen toernooi daar de prijzen van tonen
        public static Toernooi OphalenPrijzenMetToernooiId()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiId == Helper.IdToernooi)
                    .Include(t => t.ToernooiPrijs.Select(sub => sub.Prijzen))
                    .SingleOrDefault();
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

        public static int AanpassenToernooi(Toernooi toernooi)
        {
            try
            {
                using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
                {

                    toernooiEntities.Entry(toernooi).State = EntityState.Modified;
                    return toernooiEntities.SaveChanges();

                }
            }
            catch (Exception ex)
            {
                FileOperations.FoutLoggen(ex);
                return 0;
            }
        }

        //gekozen toernooiOphalen
        public static List<Toernooi> OphalenToernooienViaToernooiId()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Toernooi
                    .Include(x => x.GameMode)
                    .Where(x => x.toernooiId == Helper.IdToernooi)
                    .OrderBy(x => x.datum)
                    .ThenBy(x => x.startuur)
                    .ToList();
            }
        }
    }
}
