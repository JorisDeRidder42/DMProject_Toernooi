   M S B A M L   `   `   `  ����^  ZDeRidderJoris_GRPLTId1.1_DM_Project, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null[2clr-namespace:DeRidderJoris_GRPLTId1._1_DM_Project$DeRidderJoris_GRPLTId1._1_DM_Project  5   	   5    /DeRidderJoris_GRPLTId1._1_DM_Project.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Dlocal2clr-namespace:DeRidderJoris_GRPLTId1._1_DM_Project     5   	   b ^MaterialDesignThemes.Wpf, Version=4.0.0.2422, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	      MaterialDesignBody#���   5	   	   $��Regular"�5
   	   $��13(�5   	   &   System.Windows.Media.TextOptions    TextFormattingMode$  Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignFont#���  5   	    � Title$ 
MainWindow��5   	   $	��650��6   $	��800��6)   ��5      �� 5   
    �� EndPoint$ 0.5,1&�6    �� 
StartPoint$ 0.5,0&�6/   .��5      �  � Color$ 	#FF042181��6    � Offset$ 0Q�6-   � 5      $ 	#FF673AB7��6   $ 1Q�6-   5      .��5      �  � ColumnDefinitions 5   
   �� 5      �� 5      �� 5      �� 5       � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��60 �6   �� 5       �� 5!      .+�5%   
   �� $#��Inschrijven voor een toernooi��6   $��	Open Sans)�68   $��20(�6O   $��Center=�6]   $
��Bold"�6x   $��4��6�   $��0��6�   $��0��6�   $��10q�6�   
�������6�   �� 5(   
   -   5        	 ��Name$	 btnAfsluiten��5*   S    , (MaterialDesignFloatingActionAccentButton#��[ 5)   	   $��3��6K   $��0��6[   $	��Top=�6h   $��Right=�6�   $��10q�6�   
 � ToolTip$.
 (MaterialDesignFloatingActionAccentButton��5*   	   $��50��6<   $��50��6G   .��5+      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ PowerStandby=�6&   $��30��6:   $��30��6F   5,      �� 5.   
   $��0��6   $��1��6!   $��3��6.   $��4��6?   $��10q�6S   ._�5/      �� $+��%Voor welk spel wil je je inschrijven?��6   $��	Open Sans)�6D   $��20(�6[   $
��Bold"�6i   
�������$	��Top=�6�   $��20q�6�   $��Center=�6�   50      �� 53   
   -   5        $	 btnRocketLeague��53      $��0��6*   $��2��6:   $	��120��6G   $	��120��6S   $��10q�6`   $��0q�6l   ��54      �� 55       �� ImageSource$# images/rocket-league-logo.jpg��6   57      �� 58   
   -   5         ��Name$ lblRocketLeague��58      $��Rocket League��6)   $��0��6A   $��2��6Q   $��Center=�6^   $��Bottom=�6{   
�������$��20q�6�   $��	Open-sans)�6�   �� 5:   
   -   5        $	 btnFortnite��5:      $��1��6&   $��2��66   $	��120��6C   $	��120��6O   $��10q�6\   $��0q�6h   ��5;      �� 5<      $ images/fortnite-logo.jpg��6   5>      �� 5?   
   -   5        $ lblFortnite��5?      $��Fortnite��6%   $��1��68   $��2��6H   $��Center=�6U   $��Bottom=�6r   
�������$��20q�6�   �� 5A   
   -   5        $	 btnLeagueOfLegends��5A      $��2��6-   $��2��6=   $	��120��6J   $	��120��6V   $��10q�6c   $��0q�6o   ��5B      �� 5C      $% images/Leagueoflegends-icon.jpg��6   5E      �� 5F   
   -   5        $ lblLeagueOfLegends��5F      $��League of legends��6,   $��2��6H   $��2��6X   $��Center=�6e   $��Bottom=�6�   
�������$��20q�6�   �� 5H   
   -   5        $	 btnValorant��5H      $��3��6&   $��2��66   $	��120��6C   $	��120��6O   $��10q�6\   $��0q�6h   ��5I      �� 5J      $ images/Valorant-logo.jpg��6   5L      �� 5M   
   -	   5        $ lblLValorant��5M      $��Valorant��6&   $��3��69   $��2��6I   $��Center=�6V   $��Bottom=�6s   
�������$��20q�6�   �� 5O   
   -
   5        $	 btnCSGO��5O      $��0��6"   $��3��62   $	��120��6?   $	��120��6K   $��10q�6X   $��0q�6d   ��5P      �� 5Q      $ images/CSGO.jpg��6   5S      �� 5T   
   -   5        $ lblCounterStrike��5T      $��Counter-strike��6*   $��0��6C   $��3��6S   $��Center=�6`   $��Bottom=�6}   
�������$��20q�6�   �� 5W   
   -   5        $	 btnDota��5W      $��1��6"   $��3��62   $	��120��6?   $	��120��6K   $��10q�6X   $��0q�6d   ��5X      �� 5Y      $ images/dota-logo.jpg��6   5[      �� 5\   
   -   5        $ lblDota2��5\      $��Dota 2��6"   $��1��63   $��3��6C   $��Center=�6P   $��Bottom=�6m   
�������$��20q�6�   �� 5^   
   -   5        $	 btnCodWarzone��5^      $��2��6(   $��3��68   $	��120��6E   $	��120��6Q   $��10q�6^   $��0q�6j   ��5_      �� 5`      $" images/CallofdutyWarzone.png��6   5b      �� 5c   
   -   5        $ lblCODWZ��5c      $��Call of duty: Warzone��6#   $��2��6C   $��3��6S   $��Center=�6`   $��Bottom=�6}   
�������$��20q�6�   �� 5e   
   -   5        $	 btnapexlegends��5e      $��3��6)   $��3��69   $	��120��6F   $	��120��6R   $��10q�6_   $��0q�6k   ��5f      �� 5g      $" images/apex-legends-icon.png��6   5i      �� 5j   
   -   5        $ lblApexLegends��5j      $��Apex Legends��6(   $��3��6?   $��3��6O   $��Center=�6\   $��Bottom=�6y   
�������$��20q�6�   5k      5l      