// build.mjs

import StyleDictionary from 'style-dictionary';
import { registerSwiftTransforms } from './transforms/swift-transforms.mjs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

registerSwiftTransforms(StyleDictionary);

const BRANDS = ['berry', 'olive', 'lime'];
const SCHEMES = ['light', 'dark'];

const SWIFT_OUTPUT_DIR = path.resolve(
  __dirname,
  '../Sources/DesignSystem/Tokens/Generated'
);

const cap = (s) => s.charAt(0).toUpperCase() + s.slice(1);

for (const brand of BRANDS) {
  for (const scheme of SCHEMES) {
    const sd = new StyleDictionary({
      source: [
        `tokens/primitives/${brand}.json`,
        `tokens/semantics/${brand}/${scheme}.json`,
        'tokens/components/**/*.json'
      ],

      usesDtcg: true,

      platforms: {
        swiftui: {
          transformGroup: 'swiftui-colors',
          buildPath: `${SWIFT_OUTPUT_DIR}/`,

          files: [
            {
              destination: `${cap(brand)}+${cap(scheme)}+Semantic.swift`,
              format: 'swift/color-struct',

              filter: (token) =>
                token.filePath.includes('/semantics/'),

              options: {
                brandName: cap(brand),
                scheme: cap(scheme),
                namespace: 'Semantic'
              }
            },

            {
              destination: `${cap(brand)}+${cap(scheme)}+Components.swift`,
              format: 'swift/color-struct',

              filter: (token) =>
                token.filePath.includes('/components/'),

              options: {
                brandName: cap(brand),
                scheme: cap(scheme),
                namespace: 'Components',
                accessLevel: 'internal'
              }
            }
          ]
        }
      }
    });

    await sd.buildAllPlatforms();
  }
}

console.log(`✅ Tokens generated for ${BRANDS.join(', ')}`);