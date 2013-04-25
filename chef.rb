class Chef
  attr :spread, true

  def self.make_new_chef flavor
    new(flavor)
  end

  def initialize default_flavor = nil
    @spread = default_flavor || "butter"
  end

  def toast options = {}
    options = {
      :toast_amount => 10,
      darkness: 'light'}.merge(options)

    options[:toast_amount].times do
      puts "#{options[:darkness]} toast with #{@spread}!"
    end
  end

  def salad *ingredients
    puts "Salad with: #{print_salad_ingredients *ingredients}"
  end

  def cook_up_a_storm &block
    execute_in_context &block
  rescue => e
    puts "Ooops"
  end

  def repeat_10x
    10.times do |index|
      x = begin
        yield(index)
        :did_something
      rescue StandardError => e
      rescue => e
        puts "Ooops #{e}"
        true
      ensure
        puts "Finished"
      end
    end
  end

  AuthorizedError = Class.new(StandardError)

  private

  def execute_in_context &block
    instance_eval(&block)
  end

  def print_salad_ingredients *ingredients
    ingredients.join(', ')
  end
end

chef = Chef.make_new_chef('butter')
chef.cook_up_a_storm do
  salad "beetroot", "carrots", "lettuce"
  salad "tomatos", "avocados"
  toast
  repeat_10x do |time|
    raise ArgumentError.new("Oops")
  end
end
