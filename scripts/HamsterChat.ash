void main (string sender , string message, string channel){
   if (channel == "/hobopolis"){
      if (message == "tented"){
         int people_tented = to_int(get_property("people_tented"));
         people_tented += 1;
         set_property("people_tented" , people_tented);
      }
      if (message == "staged"){
         int people_staged = to_int(get_property("people_staged"));
         people_staged += 1;
         set_property("people_staged" , people_staged);
      }
      if (message == "moshed"){
         set_property("moshed" , "true");
      }
      if (message == "off stage"){
         int people_unstaged = to_int(get_property("people_unstaged"));
         people_unstaged += 1;
         set_property("people_unstaged" , people_unstaged);
      }
   }
}
