module TonsOToner                         ##(tot
  class PrintQueue
    def submit( print_job )
      # Send the job off for printing to this laser printer
    end

    def cancel( print_job)
      # Stop!
    end
  end

  class Administration
    def power_off
      # Turn this laser printer off...
    end

    def start_self_test
      # Everything ok?
    end
  end
end                                        ##tot)


module OceansOfInk                         ##(ooi
  class PrintQueue
    def submit( print_job )
      # Send the job off for printing to this ink jet printer
    end
    # Rest omitted...
  end

  class Administration
    #  Ink jet administration code omitted...
  end
end                                         ##ooi)
