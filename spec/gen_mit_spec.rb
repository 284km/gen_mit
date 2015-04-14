require 'spec_helper'
require 'rspec/temp_dir'
require "pathname"

describe GenMit do
  let(:mit_license) do
    <<EOS
The MIT License (MIT)

Copyright (c) #{Time.now.year} #{`git config user.name`.chomp}

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
EOS
  end

  it 'has a version number' do
    expect(GenMit::VERSION).not_to be nil
  end

  describe ".call" do
    include_context "uses temp dir"

    it "should create temp_dir" do
      expect(Pathname(temp_dir)).to be_exist
    end

    let(:out_file) do
      "#{temp_dir}/LICENSE.txt"
    end

    it 'should write MIT License to stdout' do
      $stdout = StringIO.new
      Dir.chdir(temp_dir) do
        GenMit.call
      end
      expect($stdout.string).to eq (mit_license)
    end

    it 'should write MIT License to LICENSE.txt instead of stdout' do
      Dir.chdir(temp_dir) do
        GenMit.call
      end
      expect(File.read(out_file)).to eq (mit_license)
    end
  end

  describe ".license" do
    it 'should return MIT License' do
      expect(GenMit.license).to eq(mit_license)
    end
  end
end
