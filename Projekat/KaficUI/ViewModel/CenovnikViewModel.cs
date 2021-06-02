using Projekat;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KaficUI.View;
using System.Windows;

namespace KaficUI.ViewModel
{
    public class CenovnikViewModel : ValidationBase
    {
        private ObservableCollection<Cenovnik> cenovnikTemp = new ObservableCollection<Cenovnik>();
        private int kodProizvoda;
        private int cenaProizvoda;
        private MyICommand addCommand;
        private MyICommand deleteCommand;
//        private MyICommand updateCommand;
        private Cenovnik selectedCenovnik = new Cenovnik();

        public MyICommand AddCommand { get => addCommand; set => addCommand = value; }
        public MyICommand DeleteCommand { get => deleteCommand; set => deleteCommand = value; }
//        public MyICommand UpdateCommand { get => updateCommand; set => updateCommand = value; }

        protected override void ValidateSelf()
        {
     
        }

        public CenovnikViewModel()
        {
            selectedCenovnik = null;
            cenovnikTemp = new ObservableCollection<Cenovnik>(new Model1Container().Cenovniks.ToList());
            AddCommand = new MyICommand(OnAdd);
            DeleteCommand = new MyICommand(OnDelete);
 //           UpdateCommand = new MyICommand(OnUpdate);
        }

        public Cenovnik SelectedCenovnik
        {
            get { return selectedCenovnik; }
            set
            {
                if (this.selectedCenovnik != value)
                {
                    this.selectedCenovnik = value;
                    OnPropertyChanged("SelectedCenovnik");
                }
            }
        }

        public ObservableCollection<Cenovnik> CenovnikTemp
        {
            get { return cenovnikTemp; }
            set
            {
                if (this.cenovnikTemp != value)
                {
                    this.cenovnikTemp = value;
                    OnPropertyChanged("CenovnikTemp");
                }
            }
        }

        public int CenaProizvoda
        {
            get { return cenaProizvoda; }
            set
            {
                if (cenaProizvoda != value)
                {
                    cenaProizvoda = value;
                    OnPropertyChanged("CenaProizvoda");
                }
            }
        }

        public int KodProizvoda
        {
            get { return kodProizvoda; }
            set
            {
                if (kodProizvoda != value)
                {
                    kodProizvoda = value;
                    OnPropertyChanged("KodProizvoda");
                }
            }
        }

        public void OnAdd()
        {
            this.Validate();
            if(this.IsValid)
            {
                var context = new Model1Container();
                Cenovnik c = new Cenovnik();
                c.Cenap = CenaProizvoda;
                c.ProizvodKodpr = KodProizvoda;
                context.Cenovniks.Add(c);
                context.SaveChanges();
                CenovnikTemp.Add(c);

                CenovnikTemp = new ObservableCollection<Cenovnik>(new Model1Container().Cenovniks.ToList());
                CenaProizvoda = 0;
                KodProizvoda = 0;
            }
        }

        public void OnDelete()
        {
            if(SelectedCenovnik != null)
            {
                if(SelectedCenovnik.Cenap != 0)
                {
                    var context = new Model1Container();
                    Cenovnik c = context.Cenovniks.Where(x => x.Cenap == SelectedCenovnik.Cenap).FirstOrDefault();
                    context.Cenovniks.Remove(c);
                    context.SaveChanges();
                    CenovnikTemp = new ObservableCollection<Cenovnik>(new Model1Container().Cenovniks.ToList());
                    SelectedCenovnik = null;
                }
                else
                {
                    System.Windows.MessageBox.Show("Niste selektovali nista iz tabele!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);

                }
            }
            else
            {
                System.Windows.MessageBox.Show("Niste selektovali nista iz tabele!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);

            }
        }
        /*
        public void OnUpdate()
        {
            if(SelectedCenovnik != null)
            {
                if(SelectedCenovnik.Cenap != 0)
                {
                    var context = new Model1Container();
                    Cenovnik c = context.Cenovniks.Where(x => x.Cenap == SelectedCenovnik.Cenap).FirstOrDefault();

                }
                else
                {
                    System.Windows.MessageBox.Show("Niste selektovali nista iz tabele!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);

                }
            }
            else
            {
                System.Windows.MessageBox.Show("Niste selektovali nista iz tabele!", "Greska!", MessageBoxButton.OK, MessageBoxImage.Error);

            }
        } */
    }
}
