require 'mfrc522'

class Rfid
	def read_uid
		r = MFRC522.new
		r.picc_request(MFRC522::PICC_REQA)
		begin
   		uid, sak = r.picc_select
   		puts "uid: #{uid}"
		end		
	end
end

if __FILE__==$0

rf = Rfid.new
uid = rf.read_uid

end
