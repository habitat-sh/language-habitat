describe "language-habitat grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("language-habitat")

    runs ->
      grammar = atom.grammars.grammarForScopeName("source.habitat")

  describe "LanguageHabitatView", ->

    it "has one valid test", ->
      expect("life").toBe "life"

    it "parses the grammar", ->
      expect(grammar).toBeTruthy()
      expect(grammar.scopeName).toBe "source.habitat"

    it "tokenizes self", ->
      {tokens} = grammar.tokenizeLine('self')
      expect(tokens[0]).toEqual value: 'self', scopes: ['source.habitat']
