# qgxt_design_a_minima.rb

require 'json'
require 'terminal-table'

# Data Pipeline Analyzer class
class DataPipelineAnalyzer
  attr_accessor :pipeline_data

  def initialize(pipeline_data)
    @pipeline_data = pipeline_data
  end

  def analyze
    # Load pipeline data from JSON file
    data = JSON.parse(pipeline_data)

    # Extract relevant data
    pipeline_name = data['pipeline_name']
    stages = data['stages']

    # Create a table to display pipeline data
    rows = []
    stages.each do |stage|
      rows << [
        stage['name'],
        stage['status'],
        stage['duration']
      ]
    end

    table = Terminal::Table.new headings: ['Stage', 'Status', 'Duration'], rows: rows

    # Print pipeline analysis report
    puts "Pipeline Analysis Report for #{pipeline_name}"
    puts table
  end
end

# Load pipeline data from a file
pipeline_data = File.read('pipeline_data.json')

# Create a DataPipelineAnalyzer instance
analyzer = DataPipelineAnalyzer.new(pipeline_data)

# Run the analysis
analyzer.analyze