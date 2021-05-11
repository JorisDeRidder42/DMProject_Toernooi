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
            //id ophalen en plaatsen in label
            Toernooi toernooi = DatabaseOperations.OphalenWedstrijdId();
            List<Toernooi> toernooi1 = DatabaseOperations.OphalenPrijsId();
            lblImageDatumTijdLabel.Content = "begint " + toernooi.startdatum.ToString("dd/MM/yyyy") + " | " + toernooi.CheckInuur.ToString("hh\\:mm");
            lblImageLabel.Content = toernooi.Gamemode.Replace("-", " ");

            lblDatum.Content = toernooi.startdatum.ToString("dd / MM / yyyy");
            lblTijd.Content = toernooi.CheckInuur.ToString("hh\\:mm");
            lblEersteGame.Content = toernooi.Startuur.ToString("hh\\:mm");

            lblLijnup.Content = toernooi.toernooiNaam.Substring(0, toernooi.toernooiNaam.LastIndexOf('_'));
            toernooi.toernooiNaam = toernooi.toernooiNaam.Replace("_", " ");
            lblSpel.Content = toernooi.Gamemode.Replace("-", " ");
            cmbRewards.ItemsSource = toernooi1[2].Prijs;
        }

        private void btnAnnuleren_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnBewaren_Click(object sender, RoutedEventArgs e)
        {
            
        }
    }
}
