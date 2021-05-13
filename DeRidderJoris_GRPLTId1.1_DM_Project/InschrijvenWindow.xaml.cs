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
            //Toernooi ranking = DatabaseOperations.OphalenRanksPerId();
            lblImageDatumTijdLabel.Content = "begint " + toernooi.datum.ToString("dd/MM/yyyy") + " | " + toernooi.checkInuur.ToString("hh\\:mm");
            lblImageLabel.Content = toernooi.gameMode.Replace("-", " ");

            lblDatum.Content = toernooi.datum.ToString("dd / MM / yyyy");
            lblTijd.Content = toernooi.checkInuur.ToString("hh\\:mm");
            lblEersteGame.Content = toernooi.startUur.ToString("hh\\:mm");

            lblLijnup.Content = toernooi.toernooiNaam.Substring(0, toernooi.toernooiNaam.LastIndexOf('_'));
            toernooi.toernooiNaam = toernooi.toernooiNaam.Replace("_", " ");
            lblSpel.Content = toernooi.gameMode.Replace("-", " ");
        }

        private void btnAnnuleren_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnBewaren_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void cmbRewards_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
