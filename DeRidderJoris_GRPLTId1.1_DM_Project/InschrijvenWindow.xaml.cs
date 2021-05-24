﻿using DeRidderJoris_GRPLTId1._1_DM_DAL;
using DeRidderJoris_GRPLTId1._1_DM_Models;
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

            ////lijst van ranks ophalen
            List<Rank> toernooiMetRanks = DatabaseOperations.OphalenToernooiMetRanks();
            cmbRank.ItemsSource = toernooiMetRanks;


            List<Prijs> toernooiMetPrijzen = DatabaseOperations.OphalenPrijzen();
            cmbPrijzen.ItemsSource = toernooiMetPrijzen;



            Toernooi ophalenToernooi = DatabaseOperations.OphalenImageMetId();
            //laad image a.d.h.v gekozen spel
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

        private void btnAnnuleren_Click(object sender, RoutedEventArgs e)
        {
            //alles txt en cmb boxen leegmaken
            Wissen();
        }

        private void btnBewaren_Click(object sender, RoutedEventArgs e)
        {
            string foutmelding = Valideer("columnName");
            if (string.IsNullOrWhiteSpace(foutmelding))
            {
                Rank rank = cmbRank.SelectedItem as Rank;

                Speler speler = new Speler();
                speler.voornaam = txtVoornaam.Text;
                speler.achternaam = txtAchternaam.Text;
                speler.nicknaam = txtNickName.Text;
                speler.geboortedatum = txtGeboortedatum.DisplayDate;
                speler.geboorteplaats = txtGeboortePlaats.Text;
                speler.email = txtMail.Text;
                speler.wachtwoord = FloatingPasswordBox.Password;

                //if (speler.IsGeldig())
                //{
                //    int oke = DatabaseOperations.
                //}
            }
        }
        private void btnHome_Click(object sender, RoutedEventArgs e)
        {
            //terug naar vorige scherm
            this.Close();
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
            cmbRank.SelectedItem = "";
            cmbPrijzen.SelectedItem = "";
            FloatingPasswordBox.Clear();
        }
        private string Valideer(string columnName)
        {
            if (columnName == "cmbRank" && cmbRank.SelectedItem == null)
            {
                return "Selecteer een Rank!" + Environment.NewLine;
            }
            if (columnName == "Voornaam" && txtVoornaam.Text == null)
            {
                return "Gelieve uw voornaam in te geven!" + Environment.NewLine;
            }
            if (columnName == "Achternaam" && txtAchternaam.Text == null)
            {
                return "Gelieve uw achternaam in te geven!" + Environment.NewLine;
            }
            if (columnName == "Nicknaam" && txtNickName.Text == null)
            {
                return "Gelieve uw spelnaam in te geven!" + Environment.NewLine;
            }
            if (columnName == "Email" && txtMail.Text == null)
            {
                return "Gelieve uw email in te geven!" + Environment.NewLine;
            }

            return "";
        }

        private void btnVerwijderen_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
