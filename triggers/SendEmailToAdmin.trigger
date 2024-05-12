trigger SendEmailToAdmin on Account (after insert) {
  /* List<Messaging.SingleEmailMessage> mails= new List<Messaging.SingleEmailMessage>();
    User useraObj = [SELECT id,email from user where Profile.name = 'System Administrator'];
    for(Account acc :Trigger.new){
        If(useraObj.Email != null){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.SetSenderDisplayName('Salesforce');
            mail.setUseSignature(false);
			mail.setBccSender(false);
			mail.setSaveAsActivity(false);
          //  mail.toAddresses = new String[]{useraObj.Email};
            mail.setSubject('New Account was Created.');
            String body = 'Dear System Administrator, <br/>';
			body += 'An account has been created and name is '+acc.Name+'.';
            mail.setHtmlBody(body);
            mails.add(mail);
        }
    }
    if(mails.size()>0){
//" Messaging.sendEmail(mails) " is used to send the list of mails
Messaging.SendEmailResult[] results = Messaging.sendEmail(mails);
//we are checking if the mails are sent or not.
if (results[0].success)
{
System.debug('The email was sent successfully.');
} else {
System.debug('The email failed to send: '+ results[0].errors[0].message);
}
}
*/
}