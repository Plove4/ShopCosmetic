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
using ShopCosmetic.AppDateFile;
using ShopCosmetic.Properties;

namespace ShopCosmetic
{
    /// <summary>
    /// Логика взаимодействия для WindowProductGrid.xaml
    /// </summary>
    public partial class WindowProductGrid : Window
    {
        public WindowProductGrid()
        {
            InitializeComponent();

            RefreshProduct();
        }

        private int currentPage = 1;
        private int maxpage = 0;
        public void RefreshProduct()
        {
            DataGridProduct.ItemsSource = DBcontext.Context.Product.ToList();
            maxpage = Convert.ToInt32(Math.Ceiling(DBcontext.Context.Product.ToList().Count * 1.0 / 10));

            var listproduct = DBcontext.Context.Product.ToList().Skip((currentPage - 1) * 10).Take(10).ToList();

            txttotalpage.Text = "of " + maxpage.ToString();
            txtcurrentpagenumber.Text = currentPage.ToString();
            DataGridProduct.ItemsSource = listproduct;
        }

        private void txtcurrentpagenumber_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (currentPage > 0 && currentPage < maxpage && txtcurrentpagenumber.Text == "")
            {
                currentPage = Convert.ToInt32(txtcurrentpagenumber.Text);
                RefreshProduct();
            }
        }

        private void GodirstPagebrn_Click(object sender, RoutedEventArgs e)
        {
            currentPage = 1;
            RefreshProduct();
        }

        private void GoPrevPagebtn_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage - 1 < 1)
            {
                return;
            }
            currentPage --;
            RefreshProduct();
        }

        private void GoNextPagebtn_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage + 1 > maxpage)
            {
                return;
            }
            currentPage ++;
            RefreshProduct();
        }

        private void GoLustPagebtn_Click(object sender, RoutedEventArgs e)
        {
            currentPage = maxpage;
            RefreshProduct();
        }
    }
}
