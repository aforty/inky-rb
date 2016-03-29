require 'spec_helper'

RSpec.describe "Container" do
  it "creates a container table" do
    input = '<container></container>'
    expected = <<-HTML
      <table class="container">
        <tbody>
          <tr>
            <td></td>
          </tr>
        </tbody>
      </table>
    HTML

    compare(input, expected)
  end
end

RSpec.describe 'Grid' do
  it 'creates a row' do
    input = '<row></row>'
    expected =  <<-HTML
      <table class="row">
        <tbody>
          <tr></tr>
        </tbody>
      </table>
    HTML

    compare(input, expected)
  end

  it 'creates a single column with first and last classes' do
    input = '<columns large="12" small="12"></columns>'
    expected = <<-HTML
      <th class="small-12 large-12 columns first last">
        <table>
          <tr>
            <th class="expander"></th>
          </tr>
        </table>
      </th>
    HTML

    compare(input, expected)
  end

  it 'creates two columns, one first, one last' do
    input = <<-INKY
      <body>
        <columns large="6" small="12"></columns>
        <columns large="6" small="12"></columns>
      </body>
    INKY
    expected = <<-HTML
      <body>
        <th class="small-12 large-6 columns first">
          <table>
            <tr>
              <th class="expander"></th>
            </tr>
          </table>
        </th>
        <th class="small-12 large-6 columns last">
          <table>
            <tr>
              <th class="expander"></th>
            </tr>
          </table>
        </th>
      </body>
    HTML

    compare(input, expected)
  end

  it 'creates 3+ columns, first is first, last is last' do
    input = <<-INKY
      <body>
        <columns large="4" small="12"></columns>
        <columns large="4" small="12"></columns>
        <columns large="4" small="12"></columns>
      </body>
    INKY
    expected = <<-INKY
    <body>
      <th class="small-12 large-4 columns first">
        <table>
          <tr>
            <th class="expander"></th>
          </tr>
        </table>
      </th>
      <th class="small-12 large-4 columns">
        <table>
          <tr>
            <th class="expander"></th>
          </tr>
        </table>
      </th>
      <th class="small-12 large-4 columns last">
        <table>
          <tr>
            <th class="expander"></th>
          </tr>
        </table>
      </th>
    </body>
    INKY

    compare(input, expected)
  end

  it 'offsets a column' do
    input = '<columns class="small-offset-8"></columns>'
    expected = <<-HTML
      <th class="small-12 large-12 columns small-offset-8 first last">
        <table>
          <tr>
            <th class="expander"></th>
          </tr>
        </table>
      </th>
    HTML

    compare(input, expected)
  end

  #if it just has small, borrow from small for large
  it 'automatically assigns large columns if no large attribute is assigned' do
    input = <<-HTML
    <body>
      <columns small="4"></columns>
      <columns small="8"></columns>
    </body>
    HTML
    expected = <<-INKY
    <body>
      <th class="small-4 large-4 columns first">
        <table>
          <tr>
            <th class="expander"></th>
          </tr>
        </table>
      </th>
      <th class="small-8 large-8 columns last">
        <table>
          <tr>
            <th class="expander"></th>
          </tr>
        </table>
      </th>
    </body>
    INKY

    compare(input, expected)
  end

  it 'automatically assigns small columns as full width if only large defined' do
    input = <<-INKY
    <body>
      <columns large="4"></columns>
      <columns large="8"></columns>
    </body>
    INKY
    expected = <<-HTML
    <body>
      <th class="small-12 large-4 columns first">
        <table>
          <tr>
            <th class="expander"></th>
          </tr>
        </table>
      </th>
      <th class="small-12 large-8 columns last">
        <table>
          <tr>
            <th class="expander"></th>
          </tr>
        </table>
      </th>
    </body>
    HTML

    compare(input, expected)
  end

  it 'supports nested grids' do
    input = '<row><columns><row></row></columns></row>'
    expected = <<-HTML
      <table class="row">
        <tbody>
          <tr>
            <th class="small-12 large-12 columns first last">
              <table>
                <tr>
                  <th>
                    <table class="row">
                      <tbody>
                        <tr></tr>
                      </tbody>
                    </table>
                  </th>
                </tr>
              </table>
            </th>
          </tr>
        </tbody>
      </table>
    HTML

    compare(input, expected)
  end
end

RSpec.describe 'Block Grid' do
  it 'returns the correct block grid syntax' do
    input = '<block-grid up="4"></block-grid>'
    expected = <<-HTML
      <table class="block-grid up-4">
        <tr></tr>
      </table>
    HTML

    compare(input, expected)
  end
end