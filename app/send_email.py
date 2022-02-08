import smtplib
import ssl
import email.message

def send_email_starttls(mex):
    port = 587  # For starttls
    smtp_server = "smtp.office365.com"
    sender_email = "s___XXX@bxoxsxmxax.it"
    receiver_email = "m.buccxxxxxxx@bxixoxent.com"
    password = "metti_pwd"
    msg = email.message.Message()
    msg['From'] = sender_email
    msg['To'] = receiver_email
    msg['Subject'] = "Prova email python"
    msg.add_header('Content-Type', 'text')
    msg.set_payload(mex)
    context = ssl.create_default_context()
    with smtplib.SMTP(smtp_server, port) as server:
        # server.set_debuglevel(1)
        server.starttls(context=context)
        server.login(sender_email, password)
        server.sendmail(sender_email, receiver_email, msg.as_string())
        server.quit()

# send_email_starttls('ciao')
