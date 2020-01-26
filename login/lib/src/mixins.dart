class ValidateMixin
{
    String emailValidate(String data)
    {
        
        bool valid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(data);
        if (valid == false){
        return 'Please enter valid email address';}
        else {
        return null; }
    }
    String passValidate(String data)
    {
      if(data.length<=4){
        return 'Doesnot meet password requirement';}
        else {
        return null;}
    }

    
}