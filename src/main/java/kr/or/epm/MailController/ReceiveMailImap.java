package kr.or.epm.MailController;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.UIDFolder;
import javax.mail.internet.MimeBodyPart;

import kr.or.epm.VO.Mail;

public class ReceiveMailImap {

    private static long previousUID = 1;

    public ReceiveMailImap() {
    }

    public static void main(String[] args) throws Exception {
      /*  doit(String id, String pwd);*/
    }
    
    
    //메일 카운트 구하기(총 갯수)
    public static int countMail(String id, String pwd){
    	Folder folder = null;
        Store store = null;
        int result = 0;
        try {
            Properties props = System.getProperties();
            props.setProperty("mail.store.protocol", "imaps");
            Session session = Session.getDefaultInstance(props, null);
            store = session.getStore("imaps");
            //id와 pwd 부분에 네이버 아이디와 비밀번호를 넣습니다. 첫 번째 인자에는 원하는 메일의 imap 주소를 넣습니다.(저는 네이버를 사용했습니다.)
            store.connect("imap.gmail.com", id, pwd);
            //Inbox라고 써있는 부분에 받아오고 싶은 메일 폴더 이름을 넣습니다. Inbox는 받은메일함 폴더를 의미합니다.
            folder = store.getFolder("Inbox");
            folder.open(Folder.READ_WRITE);
            UIDFolder uf = (UIDFolder) folder;
            //읽지 않은 메일을 읽어오고 싶다면 이렇게 message를 받아오고
            //Message messages[] = folder.search(new FlagTerm(new Flags(Flags.Flag.SEEN), false));
            //특정 번호 사이의 메일을 받아오고 싶다면 getMessageByUID를 사용하면 됩니다. UIDFolder.LASTUID를 이용하면 해당 폴더의 마지막 메일 번호를 알아서 알려줍니다.
            Message messages[] = uf.getMessagesByUID(previousUID + 1, UIDFolder.LASTUID);
            
            System.out.println(messages.length);
            result = messages.length;
        }catch(Exception e){
        	e.printStackTrace();
        }
    	
    	return result;
    }
    

    public static List<Mail> doit(String id, String pwd, String filepaths, int pgsize, int cpage) throws Exception {
        Folder folder = null;
        Store store = null;
        
        String filePath = filepaths+"\\";
       /* String filePath = "c:/temp/mail/";*/
        
        List<Mail> mail = mail = new ArrayList<Mail>();
        mail.removeAll(mail);
        try {
            Properties props = System.getProperties();
            props.setProperty("mail.store.protocol", "imaps");
            Session session = Session.getDefaultInstance(props, null);
            store = session.getStore("imaps");
            //id와 pwd 부분에 구글 아이디와 비밀번호를 넣습니다. 첫 번째 인자에는 원하는 메일의 imap 주소를 넣습니다.
            store.connect("imap.gmail.com", id, pwd);
            //Inbox라고 써있는 부분에 받아오고 싶은 메일 폴더 이름을 넣습니다. Inbox는 받은메일함 폴더를 의미합니다.
            folder = store.getFolder("Inbox");
            folder.open(Folder.READ_WRITE);
            UIDFolder uf = (UIDFolder) folder;
            //읽지 않은 메일을 읽어오고 싶다면 이렇게 message를 받아오고
            //Message messages[] = folder.search(new FlagTerm(new Flags(Flags.Flag.SEEN), false));
            //특정 번호 사이의 메일을 받아오고 싶다면 getMessageByUID를 사용하면 됩니다. UIDFolder.LASTUID를 이용하면 해당 폴더의 마지막 메일 번호를 알아서 알려줍니다.
            Message messages[] = uf.getMessagesByUID(previousUID + 1, UIDFolder.LASTUID);
            
            System.out.println(messages.length);
       
          /* for (int i = 0; i < messages.length; ++i) {*/
          /*  for (int i = 0; i < messages.length; ++i) {*/
            int start = cpage * pgsize - (pgsize - 1);
    		int end = cpage * pgsize;

    		if(messages.length<(1+end)){
                for (int i = messages.length-(start); i>-1; i--) {
                	System.out.println("메일량 없음...!!");
                    Message msg = messages[i];

                    String emp_no = getSender(msg);
                    String rec_date = new SimpleDateFormat("yy년MM월dd일HH시mm분ss초").format(msg.getReceivedDate());
                    String title = msg.getSubject();
                    //System.out.println("Saving : " + title);
                    System.out.println(emp_no);
                    //System.out.println(rec_date);
                    long uId = uf.getUID(msg);
                    
                    
                    Mail maillist = new Mail();
                    maillist.setEmp_no(emp_no);
                    maillist.setRec_check(rec_date);
                    maillist.setTitle(title);
                    
                    String fileName = "" + System.currentTimeMillis();
                    //System.out.println("파일 이름인가? : " + fileName);
                    maillist.setMail_content(fileName);
                    saveParts(uId, msg.getContent(), fileName, filePath);
                    msg.setFlag(Flags.Flag.SEEN, false);
                    
                    
                    mail.add(maillist);
                }
    		
    		
    		}else{
    			for (int i = messages.length-(start); i>messages.length-(1+end); i--) {
    				System.out.println("메일량 많음 ㅠㅠ");
    				Message msg = messages[i];
    				
    				String emp_no = getSender(msg);
    				String rec_date = new SimpleDateFormat("yy년MM월dd일HH시mm분ss초").format(msg.getReceivedDate());
    				String title = msg.getSubject();
    				//System.out.println("Saving : " + title);
    				//System.out.println(emp_no);
    				//System.out.println(rec_date);
    				long uId = uf.getUID(msg);
    				
    				
    				Mail maillist = new Mail();
    				maillist.setEmp_no(emp_no);
    				maillist.setRec_check(rec_date);
    				maillist.setTitle(title);
    				
    				String fileName = "" + System.currentTimeMillis();
    				//System.out.println("파일 이름인가? : " + fileName);
    				maillist.setMail_content(fileName);
    				saveParts(uId, msg.getContent(), fileName, filePath);
    				msg.setFlag(Flags.Flag.SEEN, false);
    				
    				
    				mail.add(maillist);
    			}
    			
    		}
            
        } finally {
            if (folder != null) {
                folder.close(true);
            }
            if (store != null) {
                store.close();
            }
        }
		return mail;
    }

    public static String getSender(Message msg) throws MessagingException {
        String from = "unknown";
        if (msg.getReplyTo().length >= 1) {
            from = msg.getReplyTo()[0].toString();
        } else if (msg.getFrom().length >= 1) {
            from = msg.getFrom()[0].toString();
        }
        return from;
    }

    public static void saveParts(long uId, Object content, String fileName, String filePath)
            throws Exception {
        String tmpFileName = fileName;
        if (content instanceof Multipart) {
            Multipart multi = ((Multipart) content);
            int parts = multi.getCount();
            for (int j = 0; j < parts; ++j) {
                MimeBodyPart part = (MimeBodyPart) multi.getBodyPart(j);
                if (part.getContent() instanceof Multipart) {
                    saveParts(uId, part.getContent(), fileName, filePath);
                } else {
                    try {
                        saveSinglePart(uId, part, fileName, filePath);
                    } catch (Exception e) {
                        e.printStackTrace();
                        try {
                            saveSinglePart(uId, part, fileName, filePath);
                        } catch (Exception ex) {

                            ex.printStackTrace();
                            saveSinglePart(uId, part, fileName, filePath);
                        }
                    }
                }
                fileName = tmpFileName;
            }
        } else {
            FileOutputStream output = new FileOutputStream(filePath + fileName + ".html");
            output.write(content.toString().getBytes());
            output.close();
        }
    }

    public static void saveSinglePart(long uId, MimeBodyPart part, String fileName, String filePath)
            throws IOException, MessagingException, InterruptedException {

        BufferedOutputStream out = null;
        BufferedInputStream in = null;
        String fileFullPath = "";
        try {
            if (part.isMimeType("text/html")) {
                fileName = fileName + ".html";
                fileFullPath = filePath + fileName;
            } else {
            	
                if (part.isMimeType("text/plain")) {
                    fileName = fileName + ".txt";
                } else {
                    fileName = fileName + "_" + part.getDataHandler().getName();
                }
                fileFullPath = filePath + fileName;
               
            }

            String result = String.format("[%d]: fileName:%s \tfilePath:%s", uId, fileName, fileFullPath);
            /**
             * ****************************************
             */
            System.out.println("... " + result);
            /**
             * ****************************************
             */
            try {
                Thread.sleep(50);
            } catch (Exception e) {
                e.printStackTrace();
            }
            out = new BufferedOutputStream(new FileOutputStream(new File(fileFullPath)));
            in = new BufferedInputStream(part.getInputStream());
            int k;
            while ((k = in.read()) != -1) {
                out.write(k);
            }
            try {
                Thread.sleep(300);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } finally {
            if (in != null) {
                in.close();
            }
            if (out != null) {
                out.flush();
                out.close();
            }
        }
    }
}
