using DeRidderJoris_GRPLTId1._1_DM_DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DeRidderJoris_GRPLTId1._1_DM_Project
{
    /// <summary>
    /// Interaction logic for InschrijvenWindow.xaml
    /// </summary>
    public partial class InschrijvenWindow : Window
    {
        public InschrijvenWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //id ophalen van gekozen toernooi en de gegevens van dat toernooi plaatsen in labels
            Toernooi toernooi = DatabaseOperations.OphalenWedstrijdId();

            lblImageDatumTijdLabel.Content = "begint " + toernooi.datum.ToString("dd/MM/yyyy") + " | " + toernooi.checkInuur.ToString("hh\\:mm");
            lblImageLabel.Content = toernooi.toernooiNaam.Substring(0, toernooi.toernooiNaam.LastIndexOf('_'));

            lblDatum.Content = toernooi.datum.ToString("dd / MM / yyyy");
            lblTijd.Content = toernooi.checkInuur.ToString("hh\\:mm");
            lblEersteGame.Content = toernooi.startuur.ToString("hh\\:mm");

            lblLijnup.Content = toernooi.toernooiNaam.Substring(0, toernooi.toernooiNaam.LastIndexOf('_'));
            toernooi.toernooiNaam = toernooi.toernooiNaam.Replace("_", " ");

            //per gamemode de verschillende ranks ophalen
            GameMode toernooiMetRanks = DatabaseOperations.OphalenGameModeMetRanks();
            cmbRank.ItemsSource = toernooiMetRanks.GameModeRanks;

            ////per toernooi de verschillende prijzen ophalen
            Toernooi toernooiMetPrijzen = DatabaseOperations.OphalenPrijzenMetToernooiId();
            cmbPrijzen.ItemsSource = toernooiMetPrijzen.ToernooiPrijzen;

            ////per gamemodeid de afbeelding ophalen
            Toernooi ophalenToernooi = DatabaseOperations.OphalenImageMetId();

            //laad image a.d.h.v gekozen gamemodeid
            switch (ophalenToernooi.gameModeId)
            {
                case 1:
                    ImageToernooi.Source = new BitmapImage(new Uri("banners/Rocket-League-Header.jpeg", UriKind.Relative));
                    break;
                case 2:
                    ImageToernooi.Source = new BitmapImage(new Uri("banners/Fortnitebanner.jpg", UriKind.Relative));
                    break;
                case 3:
                    ImageToernooi.Source = new BitmapImage(new Uri("banners/bannerLeague.png", UriKind.Relative));
                    break;
                case 4:
                    ImageToernooi.Source = new BitmapImage(new Uri("banners/Valorant-header2.jpg", UriKind.Relative));
                    break;
                case 5:
                    ImageToernooi.Source = new BitmapImage(new Uri("banners/CSGObanner.jpg", UriKind.Relative));
                    break;
                case 6:
                    ImageToernooi.Source = new BitmapImage(new Uri("banners/dota2banner.jpg", UriKind.Relative));
                    break;
                case 7:
                    ImageToernooi.Source = new BitmapImage(new Uri("banners/warzonebanner.png", UriKind.Relative));
                    break;
                default:
                    ImageToernooi.Source = new BitmapImage(new Uri("banners/apexbanner.jpg", UriKind.Relative));
                    break;
            }
        }
        private void btnBewaren_Click(object sender, RoutedEventArgs e)
        {
            string foutmelding = Valideer("cmbRank");

            if (string.IsNullOrWhiteSpace(foutmelding))
            {
                Rank rank = cmbRank.SelectedItem as Rank;
                Prijs prijs = cmbPrijzen.SelectedItem as Prijs;

                Speler speler = new Speler();
                speler.voornaam = txtVoornaam.Text;
                speler.achternaam = txtAchternaam.Text;
                speler.nicknaam = txtNickName.Text;
                speler.geboortedatum = txtGeboortedatum.DisplayDate;
                speler.geboorteplaats = txtGeboortePlaats.Text;
                speler.email = txtMail.Text;
                speler.wachtwoord = FloatingPasswordBox.Password;

                if (speler.IsGeldig())
                {

                    int ok = DatabaseOperations.ToevoegenSpeler(speler);
                    if (ok > 0)
                    {
                        Wissen();
                        if (MessageBox.Show("U bent ingeschreven!\n Wilt u zich opnieuw inschrijven voor een toernooi?", "Melding", MessageBoxButton.YesNo, MessageBoxImage.Question)== MessageBoxResult.Yes)
                        {
                            MainWindow mainWindow = new MainWindow();
                            mainWindow.Show();
                            this.Close();
                        }
                         btnVerwijderen.IsEnabled = true;
                 

                    }
                    else
                    {
                        MessageBox.Show("U bent niet ingeschreven er is iets fout!", "Foutmelding", MessageBoxButton.OK, MessageBoxImage.Error);

                    }
                }
                else
                {
                    MessageBox.Show(speler.Error);
                }

            }
            else
            {
                MessageBox.Show(foutmelding);
            }
        }

        //Speler uitschrijven
        private void btnVerwijderen_Click(object sender, RoutedEventArgs e)
        {
            //openen van het spelerswindow
            SpelerWindow spelerWindow = new SpelerWindow();
            spelerWindow.Show();
        }

        private void Wissen()
        {
            //maakt alles leeg
            txtVoornaam.Text = "";
            txtAchternaam.Text = "";
            txtNickName.Text = "";
            txtMail.Text = "";
            txtGeboortePlaats.Text = "";
            txtGeboortedatum.Text = "";
            cmbRank.SelectedIndex = -1;
            cmbPrijzen.SelectedIndex = -1;
            FloatingPasswordBox.Clear();
        }
        private string Valideer(string columnName)
        {
            DateTime datumNu = DateTime.Now;
            datumNu = datumNu.AddYears(-16);

            if (columnName == "cmbRank" && cmbRank.SelectedItem == null)
            {
                return "Selecteer een Rank!" + Environment.NewLine;
            }
            if (!DateTime.TryParse(txtGeboortedatum.Text, out DateTime gdatum))
            {
                return "deze datum is niet geldig!\n";
            }
            if (gdatum > datumNu)
            {
                return "Enkel voor 16+!\n";
            }
            return "";
        }

        private void btnAfsluiten_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Owner = this;
            this.Hide();
            mainWindow.ShowDialog();
        }
    }
}
