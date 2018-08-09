import { BigNumber } from '@0xproject/utils';
import * as chai from 'chai';
import 'mocha';

import { constants, rateUtils } from '../src';

import { chaiSetup } from './utils/chai_setup';
import { testOrderFactory } from './utils/test_order_factory';

chaiSetup.configure();
const expect = chai.expect;

describe('rateUtils', () => {
    const testOrder = testOrderFactory.generateTestSignedOrder({
        makerAssetAmount: new BigNumber(100),
        takerAssetAmount: new BigNumber(100),
        takerFee: new BigNumber(20),
    });
    describe('#getFeeAdjustedRateOfOrder', () => {
        it('throws when feeRate is zero', async () => {
            const feeRate = constants.ZERO_AMOUNT;
            expect(() => rateUtils.getFeeAdjustedRateOfOrder(testOrder, feeRate)).to.throw(
                'Expected feeRate: 0 to be greater than 0',
            );
        });
        it('throws when feeRate is less than zero', async () => {
            const feeRate = new BigNumber(-1);
            expect(() => rateUtils.getFeeAdjustedRateOfOrder(testOrder, feeRate)).to.throw(
                'Expected feeRate: -1 to be greater than 0',
            );
        });
        it('correctly calculates fee adjusted rate', async () => {
            const feeRate = new BigNumber(2); // ZRX costs 2 units of takerAsset per 1 unit of ZRX
            const feeAdjustedRate = rateUtils.getFeeAdjustedRateOfOrder(testOrder, feeRate);
            // the order actually takes 100 + (2 * 20) takerAsset units to fill 100 units of makerAsset
            expect(feeAdjustedRate).to.bignumber.equal(new BigNumber(1.4));
        });
    });
    describe('#getFeeAdjustedRateOfFeeOrder', () => {
        it('throws when takerFee exceeds makerAssetAmount', async () => {
            const badOrder = testOrderFactory.generateTestSignedOrder({
                makerAssetAmount: new BigNumber(100),
                takerFee: new BigNumber(101),
            });
            expect(() => rateUtils.getFeeAdjustedRateOfFeeOrder(badOrder)).to.throw(
                'Expected takerFee: "101" to be less than makerAssetAmount: "100"',
            );
        });
        it('correctly calculates fee adjusted rate', async () => {
            const feeAdjustedRate = rateUtils.getFeeAdjustedRateOfFeeOrder(testOrder);
            // the order actually takes 100 takerAsset units to fill (100 - 20) units of makerAsset
            expect(feeAdjustedRate).to.bignumber.equal(new BigNumber(1.25));
        });
    });
});
