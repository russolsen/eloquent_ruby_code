require '../code/doc3'

ENCRYPTION_ENABLED = true

class Document

   # Most of the class left behind...

  def self.enable_encryption( enabled )  ##(main
    if enabled 
      def encrypt_string( string )
        string.tr( 'a-zA-Z', 'm-za-lM-ZA-L')
      end
    else
      def incrypt_string( string )
        string
      end
    end
  end                             ##main)
  enable_encryption( ENCRYPTION_ENABLED )
end
