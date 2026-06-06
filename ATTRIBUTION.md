# Attribution

This database is derived from the **MinhQND Dictionary** project (https://github.com/minhqnd/dictionary), with the primary enhancement being **generated learner-friendly example sentences**. 

MinhQND Dictionary itself compiles data from multiple open-source dictionary and linguistic resources (Wiktionary, vntk/dictionary, and Hồ Ngọc Đức's Vietnamese Dictionary Project).

This project transforms and enhances the MinhQND data with additional example sentences and SQLite formatting.

## Repository Author

**Created and maintained by:** [Skypedia](https://github.com/skypediacode) (2026)

**Contributions:**

- Database processing and SQLite schema design
- Example sentence generation
- Repository creation and documentation

This version builds upon and enhances the upstream sources through data curation, validation, and transformation into a comprehensive, queryable SQLite database.

---

## Primary Source: MinhQND Dictionary

**Source:** https://github.com/minhqnd/dictionary

**Author:** minhqnd (https://minhqnd.com)

**License:** CC BY-SA 4.0 (for dictionary data)

**Contribution:** English-Vietnamese dictionary database with 357,729+ vocabulary entries, including definitions, IPA pronunciations, synonyms, and examples.

**Usage in this project:** This database is built from the MinhQND Dictionary's data export. The primary enhancement is the addition of learner-friendly generated example sentences and transformation into SQLite format.

---

## Upstream Sources (via MinhQND Dictionary)

The MinhQND Dictionary itself compiles data from multiple open-source resources:

### Wiktionary

**Source:** https://www.wiktionary.org

**License:** CC BY-SA 3.0 / CC BY-SA 4.0

**Contribution:** Core English word definitions and Vietnamese translations.

### Other Upstream Resources

**Sources cited by MinhQND Dictionary:**

- vntk/dictionary – Vietnamese dictionary data
- Hồ Ngọc Đức's Vietnamese Dictionary Project – Vietnamese lexical resources
- WikDict and open-dict-data (IPA pronunciation data)

**License:** CC BY-SA 3.0 / CC BY-SA 4.0

**Note:** For complete information about upstream sources and their contributions, consult the [MinhQND Dictionary repository](https://github.com/minhqnd/dictionary).

## Dataset Processing

### Curation & Enhancement

This dataset has undergone:

- **Filtering:** Removal of non-learner-friendly entries
- **Validation:** Verification of English-Vietnamese translation pairs
- **Enrichment:** Addition of example sentences for educational use
- **Formatting:** Normalization for SQLite storage and efficient querying

### Example Sentences

Example sentences in this dataset were generated and validated to create learner-friendly educational content. They are designed to:

- Illustrate common word usage in practical contexts
- Support vocabulary acquisition for learners
- Facilitate contextual understanding of word meanings

These generated examples are an integral part of the processed dataset distributed by this repository.

## License

This repository and database are licensed under **Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)**.

This repository distributes processed and enriched data derived from upstream open-source resources. Users should review the licenses of the original sources referenced above.

### Requirements for Redistribution

If you redistribute or create derivatives from this database, you must:

1. **Provide Attribution** – Credit the original sources listed above and this repository
2. **Include License** – Distribute under CC BY-SA 4.0 or a compatible license
3. **Share Alike** – If you modify and redistribute, the derivative work must use CC BY-SA 4.0
4. **Include ATTRIBUTION.md** – Provide this attribution document with your distribution

### Recommended Attribution

> This SQLite dictionary database was created by Skypedia (https://github.com/skypediacode) based on the MinhQND Dictionary project (https://github.com/minhqnd/dictionary), with added learner-friendly example sentences. Originally sourced from Wiktionary and other open-source linguistic resources. Licensed under CC BY-SA 4.0. See ATTRIBUTION.md for full details.

## Questions?

For questions about attribution, licensing, or usage:

- Review the original source licenses linked above
- Consult [Creative Commons CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) for the full license text and details
- Open an issue on the repository if you need clarification

This repository operates under CC BY-SA 4.0 to ensure that improvements and enhancements benefit the broader open-source and educational communities.
