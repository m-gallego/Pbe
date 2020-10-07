require 'mfrc522'

class Rfid
    def read_uid
        loop do
        r = MFRC522.new
        r.picc_request(MFRC522::PICC_REQA)
        begin
           uid, sak = r.picc_select
           puts "%02x%02x%02x%02x" % uid
        break uid if uid
        rescue
        redo
        end        
    end
end
end

if __FILE__==$0

rf = Rfid.new
uid = rf.read_uid

end

