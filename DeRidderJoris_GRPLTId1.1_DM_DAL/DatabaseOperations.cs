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
        //mainWindow ophalen
        public static GameMode OphalenGekozenSpel()

        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.GameMode
                    .Where(t => t.gameModeNaam == Helper.buttonSpel)
                    .Include(x => x.Toernooien)
                  .SingleOrDefault();
            }   
        }


        //id ophalen van gekozen toernooi en de gegevens van dat toernooi plaatsen in labels in inschrijvenWindow
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

        //ophalen gameModeid van gekozen game met alle ranks in een combobox
        public static GameMode OphalenGameModeMetRanks()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                var query = toernooiEntities.GameMode
                     .Where(r => r.gameModeId == Helper.IdGameMode)
                     .Include(r => r.GameModeRanks.Select(sub => sub.Rank));
                    return query .SingleOrDefault();
            }
        }


        //ophalen toernooiId enkel gekozen toernooi met alle prijzen in een combobox
        public static Toernooi OphalenPrijzenMetToernooiId()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(t => t.toernooiId == Helper.IdToernooi)
                    .Include(t => t.ToernooiPrijzen.Select(sub => sub.Prijs))
                    .SingleOrDefault();
            }
        }

        public static List<GameMode> OphalengameModeIds()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.GameMode
                    .ToList();
            }
        }


        //gebruikt voor het verwijderen en aanpassen van het toernooi
        public static List<Toernooi> OphalenToernooienViaToernooiId()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Toernooi
                    .Where(x => x.gameModeId == Helper.IdGameMode)
                    .OrderBy(x => x.datum)
                    .ToList();
            }
        }

        //gekozen spelerOphalen
        public static List<Speler> OphalenSpelerViaSpelerId()
        {
            using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
            {
                return toernooiEntities.Speler
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

        public static int VerwijderenSpeler(Speler speler)
        {
            try
            {
                using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
                {

                    toernooiEntities.Entry(speler).State = EntityState.Deleted;
                    return toernooiEntities.SaveChanges();

                }
            }
            catch (Exception ex)
            {
                FileOperations.FoutLoggen(ex);
                return 0;
            }
        }

        public static int AanpassenSpeler(Speler speler)
        {
            try
            {
                using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
                {

                    toernooiEntities.Entry(speler).State = EntityState.Modified;
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

        public static int ToevoegenToernooi(Toernooi toernooi)
        {
            try
            {
                using (DBToernooiEntities toernooiEntities = new DBToernooiEntities())
                {

                    toernooiEntities.Toernooi.Add(toernooi);
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
