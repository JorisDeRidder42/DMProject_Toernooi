using DeRidderJoris_GRPLTId1._1_DM_DAL;
using DeRidderJoris_GRPLTId1._1_DM_Models;
using System;
using System.Collections.Generic;
using System.Drawing;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DeRidderJoris_GRPLTId1._1_DM_Project
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void btnAfsluiten_Click(object sender, RoutedEventArgs e)
        {
            App.Current.Shutdown();
        }

        private void btnRocketLeague_Click(object sender, RoutedEventArgs e)
        {
            // roept klasse op voor het lezen welke button het is
            Helper.buttonSpel = lblRocketLeague.Content.ToString();
            OpenSchermDatabaseWindow();
        }

        private void btnFortnite_Click(object sender, RoutedEventArgs e)
        {
            Helper.buttonSpel = lblFortnite.Content.ToString();
            OpenSchermDatabaseWindow();
        }

        private void btnLeagueOfLegends_Click(object sender, RoutedEventArgs e)
        {
            Helper.buttonSpel = lblLeagueOfLegends.Content.ToString();
            OpenSchermDatabaseWindow();
        }

        private void btnValorant_Click(object sender, RoutedEventArgs e)
        {
            Helper.buttonSpel = lblLValorant.Content.ToString();
            OpenSchermDatabaseWindow();
        }

        private void btnCSGO_Click(object sender, RoutedEventArgs e)
        {
            Helper.buttonSpel = lblCounterStrike.Content.ToString();
            OpenSchermDatabaseWindow();
        }

        private void btnDota_Click(object sender, RoutedEventArgs e)
        {
            Helper.buttonSpel = lblDota2.Content.ToString();
            OpenSchermDatabaseWindow();
        }

        private void btnCodWarzone_Click(object sender, RoutedEventArgs e)
        {
            Helper.buttonSpel = lblCODWZ.Content.ToString();
            OpenSchermDatabaseWindow();
        }

        private void btnapexlegends_Click(object sender, RoutedEventArgs e)
        {
            Helper.buttonSpel = lblApexLegends.Content.ToString();
            OpenSchermDatabaseWindow();
        }
        private void OpenSchermDatabaseWindow()
        {
            DatabaseWindow databaseWindow = new DatabaseWindow();
            databaseWindow.Show();
        }
    }
}
