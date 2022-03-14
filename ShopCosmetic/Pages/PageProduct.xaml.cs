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
using System.Windows.Threading;
using ShopCosmetic.AppDateFile;

namespace ShopCosmetic.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageProduct.xaml
    /// </summary>
    public partial class PageProduct : Page
    {
        public PageProduct()
        {
            InitializeComponent();
            ListProduct.ItemsSource = DBcontext.Context.Product.ToList();
            var manufactor = DBcontext.Context.Manufacturer.ToList();
            manufactor.Insert(0, new Manufacturer { Name = "Все производители" });
            CmbManufactur.ItemsSource = manufactor;
            CmbManufactur.SelectedIndex = 0;
            CmbCost.Items.Insert(0, "Нет");
            CmbCost.Items.Insert(1, "Цена");
            CmbCost.SelectedIndex = 0;
        }

        private void SortingChange()
        {
            var sortingItem = DBcontext.Context.Product.ToList();
            if(CmbManufactur.SelectedIndex > 0)
            {
                sortingItem = sortingItem.Where(sort => sort.ManufacturerID == CmbManufactur.SelectedIndex).ToList();
            }
            if(string.IsNullOrWhiteSpace(TxtSearch.Text) == false)
            {
                sortingItem = sortingItem.Where(sort => sort.Title.ToLower().Contains(TxtSearch.Text.ToLower()) || sort.Description.ToLower().Contains(TxtSearch.Text.ToLower())).ToList();
            }
            switch (CmbCost.SelectedIndex)
            {
                case 1:
                    {
                        if(ChbAscDesc.IsChecked == true)
                        {
                            sortingItem = sortingItem.OrderByDescending(sort => sort.Cost).ToList();
                        }
                        else
                        {
                            sortingItem = sortingItem.OrderBy(sort => sort.Cost).ToList();
                        }
                        break;
                    }
            }
            ListProduct.ItemsSource = sortingItem;
        }

        private void TxtSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            SortingChange();
        }

        private void CmbManufactur_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortingChange();
        }

        private void ChbAscDesc_Checked(object sender, RoutedEventArgs e)
        {
            SortingChange();
        }

        private void ChbAscDesc_Unchecked(object sender, RoutedEventArgs e)
        {
            SortingChange();
        }

        private void CmbCost_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SortingChange();
        }        
        private void Edit_btn_Click(object sender, RoutedEventArgs e)
        {
            var item = ListProduct.SelectedItem;
            FrameOdj.frameMain.Navigate(new PageAddProduct(item as Product));
            ListProduct.ItemsSource = DBcontext.Context.Product.ToList();
        }

        private void Add_btn_Click(object sender, RoutedEventArgs e)
        {
            FrameOdj.frameMain.Navigate(new PageAddProduct(null));
            ListProduct.ItemsSource = DBcontext.Context.Product.ToList();
        }

        private void Delet_btn_Click(object sender, RoutedEventArgs e)
        {
            var delit = ListProduct.SelectedItem as Product;
            if (MessageBox.Show($"Вы хотите удалить продукт №{delit.ID} ?", "Удаление данных", MessageBoxButton.YesNo,
                MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    DBcontext.Context.Product.Remove(delit);
                    DBcontext.Context.SaveChanges();
                    MessageBox.Show("Данные удалены");
                    ListProduct.ItemsSource = DBcontext.Context.Product.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void ListProduct_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Delet_btn.Visibility = Visibility.Visible;
            Edit_btn.Visibility = Visibility.Visible;
        }
    }
}
