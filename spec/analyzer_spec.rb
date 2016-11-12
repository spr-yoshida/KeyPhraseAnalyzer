require 'spec_helper'

describe KeyPhraseAnalyzer do
  describe "#analyze" do
    it "戻り値がHashとなること" do
      sentence = ""
      analyzer = KeyPhraseAnalyzer.new(sentence)
      
      result = analyzer.analyze
      expect(result.class).to eq Hash
    end

    context "引数が'鳥取県で震度６弱 その後も活発な活動続く'の場合" do
      it '{"鳥取県"=>100, "震度"=>79, "震度6"=>52, "活動"=>49}' do
        sentence = '鳥取県で震度６弱 その後も活発な活動続く'
        analyzer = KeyPhraseAnalyzer.new(sentence)
        result = analyzer.analyze

        expected = {"鳥取県"=>100, "震度"=>79, "震度6"=>52, "活動"=>49}
        expect(result).to eq expected
      end
    end
  end
end
