module PDFer
  class PDFerFile < Jekyll::StaticFile
    def write(dest)
      # do nothing
    end
  end

  class Generator < Jekyll::Generator
    def generate(site)
      resume_md = site.static_files.detect {|file| file.extname == 'md'}
      Dir.foreach Dir.pwd.concat '/_includes' do |file|
        if file.end_with? '.md' then
          full_file = Dir.pwd.concat '/_includes/'.concat file
          pdf_subir = '/pdfs'
          output_file = site.dest + pdf_subir
          %x( gimli -f #{full_file} -o #{output_file} )

          puts site.dest
          puts pdf_subir
          site.static_files << PDFerFile.new(site, site.dest, pdf_subir, file.gsub('.md', '.pdf'))
        end
      end
    end
  end
end
