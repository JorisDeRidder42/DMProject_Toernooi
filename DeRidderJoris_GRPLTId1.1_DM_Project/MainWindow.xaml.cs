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

        private void btnFortnite_Click(object sender, RoutedEventArgs e)
        {
            DatabaseWindow databaseWindow = new DatabaseWindow();
            databaseWindow.Show();
        }

        private void btnRocketLeague_Click(object sender, RoutedEventArgs e)
        {
            // image laten laden uit de DAL laag
            // pad in code behind zetten
            //DatabaseWindow databaseWindow = new DatabaseWindow();
            //databaseWindow.Show();
            InschrijvenWindow inschrijvenWindow = new InschrijvenWindow();
            inschrijvenWindow.Show();

        }

        private void btnLeagueOfLegends_Click(object sender, RoutedEventArgs e)
        {
            DatabaseWindow databaseWindow = new DatabaseWindow();
            databaseWindow.Show();
        }

        private void btnValorant_Click(object sender, RoutedEventArgs e)
        {
            DatabaseWindow databaseWindow = new DatabaseWindow();
            databaseWindow.Show();
        }

        private void btnCSGO_Click(object sender, RoutedEventArgs e)
        {
            DatabaseWindow databaseWindow = new DatabaseWindow();
            databaseWindow.Show();
        }

        private void btnDota_Click(object sender, RoutedEventArgs e)
        {
            DatabaseWindow databaseWindow = new DatabaseWindow();
            databaseWindow.Show();
        }

        private void btnStarCraft_Click(object sender, RoutedEventArgs e)
        {
            DatabaseWindow databaseWindow = new DatabaseWindow();
            databaseWindow.Show();
        }

        private void btnSuperSmash_Click(object sender, RoutedEventArgs e)
        {
            DatabaseWindow databaseWindow = new DatabaseWindow();
            databaseWindow.Show();
        }
    }
}
