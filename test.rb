require './livrorenovator'

lr = LivroRenovator.new 12005601401327, 7635
lr.renew_all!
if lr.renewed?
  puts 'Renovados com sucesso!'
else
  puts 'Algum erro ocorreu...'
end