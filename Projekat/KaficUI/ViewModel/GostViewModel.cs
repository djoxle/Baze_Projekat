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
    public class GostViewModel : ValidationBase
    {
        private ObservableCollection<Gost> gostTemp = new ObservableCollection<Gost>();
        private int sifraGosta;
        private int sifraZaposlenog;
        private MyICommand addCommand;
        private MyICommand deleteCommand;
        //        private MyICommand updateCommand;
        private Gost selectedGost = new Gost();

        public MyICommand AddCommand { get => addCommand; set => addCommand = value; }
        public MyICommand DeleteCommand { get => deleteCommand; set => deleteCommand = value; }

        public GostViewModel()
        {
            SelectedGost = null;
            gostTemp = new ObservableCollection<Gost>(new Model1Container().Gosts.ToList());
            AddCommand = new MyICommand(OnAdd);
            DeleteCommand = new MyICommand(OnDelete);

        }

        protected override void ValidateSelf()
        {

        }

        public int SifraGosta
        {
            get { return sifraGosta; }
            set
            {
                if (sifraGosta != value)
                {
                    sifraGosta = value;
                    OnPropertyChanged("SifraGosta");
                }
            }
        }

        public int SifraZaposlenog
        {
            get { return sifraZaposlenog; }
            set
            {
                if (sifraZaposlenog != value)
                {
                    sifraZaposlenog = value;
                    OnPropertyChanged("SifraZaposlenog");
                }
            }
        }

        public Gost SelectedGost
        {
            get { return selectedGost; }
            set
            {
                if (this.selectedGost != value)
                {
                    this.selectedGost = value;
                    OnPropertyChanged("SelectedGost");

                }
            }
        }

        public ObservableCollection<Gost> GostTemp
        {
            get { return gostTemp; }
            set
            {
                if (this.gostTemp != value)
                {
                    this.gostTemp = value;
                    OnPropertyChanged("GostTemp");
                }
            }
        }

        public void OnAdd()
        {
            this.Validate();
            if (this.IsValid)
            {
                var context = new Model1Container();
                Gost g = new Gost();
                g.Sifgos = SifraGosta;
                g.KonobarSifzap = SifraZaposlenog;
                context.Gosts.Add(g);
                context.SaveChanges();
                GostTemp.Add(g);

                GostTemp = new ObservableCollection<Gost>(new Model1Container().Gosts.ToList());
                SifraGosta = 0;
                SifraZaposlenog = 0;
            }
        }

        public void OnDelete()
        {
            if (SelectedGost != null)
            {
                if (SelectedGost.Sifgos != 0)
                {
                    var context = new Model1Container();
                    Gost g = context.Gosts.Where(x => x.Sifgos == SelectedGost.Sifgos).FirstOrDefault();
                    context.Gosts.Remove(g);
                    context.SaveChanges();
                    GostTemp = new ObservableCollection<Gost>(new Model1Container().Gosts.ToList());
                    SelectedGost = null;
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
    }
}
