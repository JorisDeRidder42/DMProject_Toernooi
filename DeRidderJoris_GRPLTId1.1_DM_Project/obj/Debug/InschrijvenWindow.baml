   M S B A M L   `   `   `  ����^  ZDeRidderJoris_GRPLTId1.1_DM_Project, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null[2clr-namespace:DeRidderJoris_GRPLTId1._1_DM_Project$DeRidderJoris_GRPLTId1._1_DM_Project  5   	   <    6DeRidderJoris_GRPLTId1._1_DM_Project.InschrijvenWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Dlocal2clr-namespace:DeRidderJoris_GRPLTId1._1_DM_Project     5   	   b ^MaterialDesignThemes.Wpf, Version=4.0.0.2422, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   -   5           MaterialDesignBody#���   5   	   $��Regular"�5	   	   $��13(�5
   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignFont#���  5   	    � Title$ InschrijvenWindow��5   	   $	��650��6#   $	��800��60   .��5      �  � ColumnDefinitions 5   
   �� 5      $
��auto �6   �� 5      �� 5      �� 5       � RowDefinitions 5   
   �� 5      �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $
��auto �6   �� 5      $
��auto �6   .+�5    
   �� -   5        $��ImageToernooi��5       $��0��6&   $��0��66   $��4��6C   $
��auto��6W   $
��Fill=�6d   6u   �� 5!   
   -   5         ��Name$ btnAfsluiten��5#   S    & "MaterialDesignFloatingActionButton#��[ 5"   	   $��3��6E   $��0��6U   $	��Top=�6b   $��Right=�6z   $��10q�6�    � ToolTip$. (MaterialDesignFloatingActionAccentButton��5#   	   $��50��6<   $��50��6G   .��5$      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$
 Home=�6&   $��30��62   $��30��6>   5%      �� 5(   
    �� Orientation$ Vertical=�6   $��0��6,   $��0��6<   $��4��6I   $��Bottom=�6]   $��10q�6x   .+�5)      �� -   5        	 ��Name$	 lblImageDatumTijdLabel��5)      $�� ��64   $��15(�6?   
�������6M   �� 5*      -   5        $	 lblImageLabel��5*      $�� ��6+   $��20(�66   $
��Bold"�6D   
�������6V   5+      �� 5.   
   $��0��6   $��1��6!   $��2��6.   $��10q�6?   ���	#FFECECEC
 �� CornerRadius$
 20��6b   ._�5/      �� $ 
Horizontal=�6   .+�50      �� $ Vertical=�6   .+�51      �� -   5        $	 lblDate��51      $��Datum��6-   $
��Bold"�6=   $��	Open Sans)�6O   $��5q�6f   �� 52      -   5        $	 
lblCheckIn��52      $��Check in��60   $
��Bold"�6C   $��	Open Sans)�6U   $��5q�6l   �� 53      -   5        $	 lblFirstGame��53      $��Eerste spel��62   $
��Bold"�6H   $��	Open Sans)�6Z   $��5q�6q   �� 54      -	   5        $	 	lblLineUp��54      $��Lineup��6/   $
��Bold"�6@   $��	Open Sans)�6R   $��5q�6i   �� 55      -
   5        $	 lblRank��55      $��Ranking��6-   $
��Bold"�6?   $��	Open Sans)�6Q   $��5q�6h   56      �� 57      $ Vertical=�6   .+�58      �� -   5        $	 lblDatum��58      $�� ��6.   $��5q�69   $��	Open Sans)�6D   �� 59      -   5        $	 lblTijd��59      $�� ��6-   $��5q�68   $��	Open Sans)�6C   �� 5:      -   5        $	 lblEersteGame��5:      $�� ��63   $��5q�6>   $��	Open Sans)�6I   �� 5;      -   5        $	 	lblLijnup��5;      $�� ��6/   $��5q�6:   $��	Open Sans)�6E   �� 5<      -   5        $	 
lblRanking��5<      $��
Alle ranks��60   $��5q�6E   $��	Open Sans)�6P   5>      5?      5@      �� 5B   
   $��0��6   $��3��6!   $��10q�6.    # MaterialDesignFlatLightBgButton#��[ 6:   
�������.��5C      �� $ 
Horizontal=�6   .+�5D        $ UserHelp=�6*   �� 5E      $�� Hoe kan je meedoen?��6   5F      5G      �� 5I   
   -   5         ��Name$ 
cmbPrijzen��5I   e   $��4��6   $��10q�6     �� DisplayMemberPath$ Prijs.prijsPot��6B   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$ Prijzen��6y    " MaterialDesignOutlinedComboBox#��[ 6�   
���  ��
���  ����6,   Z� 6�   �� 5L   
   $��1��6   $��1��6!   $��3��6.   $��3��6?   $��
10,10,10,0q�6S   $
 20��6g   ��5M      �� 5N       �� EndPoint$ 0.5,1&�6&    �� 
StartPoint$ 0.5,0&�67   .��5O      �  � Color$ 	#FFECECEC��6#   5P      5R      �� 5V   
   -   5         ��Name$ txtVoornaam��5V      $��1��6'   $��1��64   $ Voornaam��6D    ! MaterialDesignOutlinedTextBox#��[ 6n   $��Center=�6�   $��20q�6�   ���	#FF673AB7 �� SelectionBrush �	#FF673AB7���	#FF673AB76�   �� 5W   
   -   5        $ txtAchternaam��5W      $��1��6)   $��2��66   $ 
Achternaam��6F   #��[ 6r   $��Center=�6�   $��20q�6�   ���	#FF673AB7���	#FF673AB76�   �� 5X   
   -   5        $ txtNickName��5X      $��1��6'   $��3��64   $ Nickname��6D   #��[ 6n   $��Center=�6�   $��20q�6�   ���	#FF673AB7���	#FF673AB76�   G� 5[   
   -   5         G�Name$ FloatingPasswordBox��5[      $��2��63   $��1��6@   $ Password��6P      
Foreground
 �  ��.  (MaterialDesignThemes.Wpf.TextFieldAssist   UnderlineBrush
 �  �� % !MaterialDesignOutlinedPasswordBox#��[ 6�   $��Center=�6  $��20q�6/  
���  ��
���  �� G� 
CaretBrush
 �  ��6^  �� 5]   
   -   5        $ cmbRank��5]      $ Rank.rankNaam��6$   $��2��6F   $��3��6S   $��20q�6c   $
 Rank��6o   #��[ 6�   
���  ��
���  ����6�   Z� 6  �� 5^   
   -   5        $ txtMail��5^      $��2��6#   $��2��60   $ E-mail��6@   #��[ 6h   $��Center=�6�   $��20q�6�   ���	#FF673AB7���	#FF673AB76�   (  "System.Windows.Controls.DatePicker  5`   
   -   5          Name$ txtGeboortedatum��5`      $��3��6/   $��1��6<   $��20q�6L   $ Geboortedatum��6X    $  MaterialDesignOutlinedDatePicker#��[ 6�   ���	#FF673AB7���	#FF673AB76�   �� 5a   
   -   5        $ txtGeboortePlaats��5a      $��3��6-   $��2��6:   $ Geboorteplaats��6J   #��[ 6z   $��Center=�6�   $��20q�6�   ���	#FF673AB7���	#FF673AB76�   �� 5d   
   -   5        $ 
btnBewaren��5d      $��Speler Bewaren��6%   $��4��6>   $��1��6K   $��20q�6[   $��Bottom=�6g    $  MaterialDesignRaisedAccentButton#��[ 6�    �� IsCancel . 6�   �� 5e   
   -   5        $ btnVerwijderen��5e      $��Speler uitschrijven��6)   $��4��6G   $��2��6T   $
��5,20q�6d   #��[ 6r   {�.  6�   5f      5g      