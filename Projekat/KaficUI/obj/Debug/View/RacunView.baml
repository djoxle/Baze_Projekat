   M S B A M L   `   `   `  ����B  >KaficUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:KaficUI.ViewKaficUI.View  5      C ?Projekat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5(clr-namespace:Projekat;assembly=ProjekatProjekat 5          KaficUI.View.RacunView   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ,localclr-namespace:KaficUI.View     5      =Projekat(clr-namespace:Projekat;assembly=Projekat     5        � 	Resources  5
         racunViewSource  DeleteCommand �� Text  UpdateCommand  
AddCommand��%�   &	        &	      &	 4     &	 T     �� 5   
   6   �� 5   
   $ Izbrisi��60   �� 5   
   $ Izmeni��60   �� 5   
   $ Dodaj��6-   5       J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command# [ 5      6B     5   
   -   5        # [ 5      6B     5   
   -   5        # [ 5      6?   .��5      �  � DataContext# [  6   .+�5   
   &   System.Windows.Controls.DataGrid     AutoGenerateColumns .  ��6   ��    Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ 	ID racuna��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 68   �� *Idr+  5      $ Id kase��6%    66   �� *	KasaIdk+  5      $ Id zaposlenog��6%    6<   �� *ZaposleniSifzap+  5      $ Datum racuna��6%    6;   �� *Datumr+  5      $ Ukupna cena racuna��6%    6A   �� *Ukupno+5      � 5   
   $��10,149,-10,-149q�6   	 � ColumnDefinitions	 5       �� 5!      $
��Auto �6#   �� 5"      $
��Auto �6#   
 � RowDefinitions
 5$      �� 5%      $
��Auto �6    �� 5&      $
��Auto �6    �� 5'      $
��Auto �6    �� 5(      $
��Auto �6    �� 5)      $
��Auto �6    .+�5+      �� $��
Id racuna:��6   $��0��6)   $
��Left=�69   $��3q�6T   $��0��6_   $��Center=�6l   �� 5,      $��1��6   $
��Left=�6&   $��23��6A   $��3q�6M   $��0��6X   $��Center=�6�   $	��120��6�   ��6e   �� *Idr+ �� Mode$ TwoWay=� �� NotifyOnValidationError .  �� ValidatesOnExceptions . 6�   �� 5-      $��Id kase:��6   $��0��6'   $
��Left=�67   $��3q�6R   $��1��6]   $��Center=�6j   �� 5.      $��1��6   $
��Left=�6&   $��23��6A   $��3q�6M   $��1��6X   $��Center=�6�   $	��120��6�   ��6e   �� *	KasaIdk+$ TwoWay=� .  . 6�   �� 5/      $��Id zaposlenog:��6   $��0��6-   $
��Left=�6=   $��3q�6X   $��2��6c   $��Center=�6p   �� 50      $��1��6   $
��Left=�6&   $��23��6A   $��3q�6M   $��2��6X   $��Center=�6�   $	��120��6�   ��6e   �� *ZaposleniSifzap+$ TwoWay=� .  . 6�   �� 51      $��Datum racuna:��6   $��0��6,   $
��Left=�6<   $��3q�6W   $��3��6b   $��Center=�6o   �� 52      $��1��6   $
��Left=�6&   $��23��6A   $��3q�6M   $��3��6X   $��Center=�6�   $	��120��6�   ��6e   �� *Datumr+$ TwoWay=� .  . 6�   �� 53      $��Datum Ukupna cena racuna:��6   $��0��68   $
��Left=�6H   $��3q�6c   $��4��6n   $��Center=�6{   �� 54      $��1��6   $
��Left=�6&   $��23��6A   $��3q�6M   $��4��6X   $��Center=�6�   $	��120��6�   ��6e   �� *Ukupno+$ TwoWay=� .  . 6�   55      �� 57   
    �� Orientation$ Vertical=�6   $��58��6-   $	��Top=�69   $��-49,154,49,0q�6Q   .+�58      �� -   5        $��btnAdd��58      $��Dodaj��6#   #��[ 63   $��11(�6Y   $��80��6g   {�.  6r   �� 59      -   5        $��	btnUpdate��59      $��Izmeni��6&   #��[ 67   $��11(�6`   $��80��6n   �� 5:      -   5        $��	btnDelete��5:   '   $��Izbrisi��6   #��[ 68   $��11(�6a   $��80��6o   5;      5<      5=      